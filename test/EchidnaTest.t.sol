// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "../src/WakuRlnV2.sol";
import "../src/LinearPriceCalculator.sol";
import "../src/Membership.sol";
import "../test/TestStableToken.sol";
import { ERC1967Proxy } from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract EchidnaTest {
    WakuRlnV2 public w;
    TestStableToken public token;
    LinearPriceCalculator public priceCalculator;

    uint32 public constant MAX_TOTAL_RATELIMIT_PER_EPOCH = 160_000;
    uint32 public constant MIN_RATELIMIT_PER_MEMBERSHIP = 20;
    uint32 public constant MAX_RATELIMIT_PER_MEMBERSHIP = 600;
    uint32 public constant ACTIVE_DURATION = 180 days;
    uint32 public constant GRACE_PERIOD_DURATION = 30 days;
    uint256 public constant MAX_SUPPLY = 1_000_000 * 10 ** 18;

    uint256[] public activeIdCommitments;
    mapping(uint32 => uint256) public indexToId;
    mapping(uint32 => uint32) public indexToRate;
    mapping(uint256 => uint32) public idToExpectedActiveDuration;

    constructor() {
        // Deploy TestStableToken via proxy
        address tokenImpl = address(new TestStableToken());
        bytes memory tokenInitData = abi.encodeCall(TestStableToken.initialize, (MAX_SUPPLY));
        ERC1967Proxy tokenProxy = new ERC1967Proxy(tokenImpl, tokenInitData);
        token = TestStableToken(address(tokenProxy));

        // Deploy LinearPriceCalculator
        priceCalculator = new LinearPriceCalculator(address(token), 0.05 ether);

        // Deploy WakuRlnV2 via proxy
        address wImpl = address(new WakuRlnV2());
        bytes memory wInitData = abi.encodeCall(
            WakuRlnV2.initialize,
            (
                address(priceCalculator),
                MAX_TOTAL_RATELIMIT_PER_EPOCH,
                MIN_RATELIMIT_PER_MEMBERSHIP,
                MAX_RATELIMIT_PER_MEMBERSHIP,
                ACTIVE_DURATION,
                GRACE_PERIOD_DURATION
            )
        );
        ERC1967Proxy wProxy = new ERC1967Proxy(wImpl, wInitData);
        w = WakuRlnV2(address(wProxy));

        // Mint and approve tokens
        token.mint(address(this), 1_000_000 ether);
        token.approve(address(w), type(uint256).max);
    }

    // Helper for proof verification
    function _verifyMerkleProof(
        uint256[20] memory proof,
        uint256 root,
        uint32 index,
        uint256 leaf,
        uint8 depth
    )
        internal
        pure
        returns (bool)
    {
        uint256 current = leaf;
        uint32 idx = index;
        for (uint8 level = 0; level < depth; level++) {
            bool isLeft = (idx & 1) == 0;
            uint256 sibling = proof[level];
            uint256[2] memory inputs;
            if (isLeft) {
                inputs[0] = current;
                inputs[1] = sibling;
            } else {
                inputs[0] = sibling;
                inputs[1] = current;
            }
            current = PoseidonT3.hash(inputs);
            idx >>= 1;
        }
        return current == root;
    }

    // Invariants

    function echidna_rate_commitments_range_correct() public view returns (bool) {
        uint32 nextFree = w.nextFreeIndex();
        if (nextFree == 0) return true;
        uint32 startIndex = 0;
        uint32 endIndex = nextFree - 1;
        uint256[] memory commitments = w.getRateCommitmentsInRangeBoundsInclusive(startIndex, endIndex);
        if (commitments.length != uint256(endIndex - startIndex + 1)) {
            return false;
        }
        for (uint32 j = startIndex; j <= endIndex; j++) {
            if (indexToRate[j] != 0) {
                uint256 exp = PoseidonT3.hash([indexToId[j], uint256(indexToRate[j])]);
                if (commitments[j - startIndex] != exp) {
                    return false;
                }
            }
        }
        return true;
    }

    function echidna_merkle_proof_valid() public view returns (bool) {
        uint32 nextFree = w.nextFreeIndex();
        if (nextFree == 0) return true;
        for (uint32 index = 0; index < nextFree && index < 10; index++) {
            uint256[20] memory proof = w.getMerkleProof(index);
            uint256 root = w.root();
            uint256 expectedCommitment = w.getRateCommitmentsInRangeBoundsInclusive(index, index)[0];
            if (!_verifyMerkleProof(proof, root, index, expectedCommitment, 20)) {
                return false;
            }
        }
        return true;
    }

    function echidna_total_rate_limit_correct() public view returns (bool) {
        uint256 computedTotal = 0;
        for (uint256 i = 0; i < activeIdCommitments.length; i++) {
            (
                uint256 depositAmount,
                uint32 activeDuration,
                uint256 gracePeriodStartTimestamp,
                uint32 gracePeriodDuration,
                uint32 rateLimitMem,
                uint32 index,
                address holder,
                address tokenAddr
            ) = w.memberships(activeIdCommitments[i]);
            computedTotal += rateLimitMem;
        }
        return w.currentTotalRateLimit() == computedTotal;
    }

    function echidna_max_total_rate_limit_valid() public view returns (bool) {
        uint32 maxTotal = w.maxTotalRateLimit();
        uint256 currentTotal = w.currentTotalRateLimit();
        uint32 maxMembership = w.maxMembershipRateLimit();
        return maxTotal >= currentTotal && maxTotal >= maxMembership;
    }

    function echidna_merkle_inserts_integrity() public view returns (bool) {
        uint32 nextFree = w.nextFreeIndex();
        if (nextFree == 0) return true;
        for (uint32 index = 0; index < nextFree && index < 10; index++) {
            uint256 commitment = w.getRateCommitmentsInRangeBoundsInclusive(index, index)[0];
            if (indexToRate[index] != 0) {
                uint256 exp = PoseidonT3.hash([indexToId[index], uint256(indexToRate[index])]);
                if (commitment != exp) {
                    return false;
                }
            }
        }
        return true;
    }

    function echidna_merkle_erasures_integrity() public view returns (bool) {
        uint32 nextFree = w.nextFreeIndex();
        if (nextFree == 0) return true;
        for (uint32 index = 0; index < nextFree && index < 10; index++) {
            uint256 commitment = w.getRateCommitmentsInRangeBoundsInclusive(index, index)[0];
            if (indexToRate[index] == 0) {
                continue; // Erased, skip
            }
            uint256[20] memory proof = w.getMerkleProof(index);
            if (!_verifyMerkleProof(proof, w.root(), index, commitment, 20)) {
                return false;
            }
        }
        return true;
    }
}
