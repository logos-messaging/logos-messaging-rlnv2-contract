// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "../src/LinearPriceCalculator.sol";
import "../src/WakuRlnV2.sol";
import "./TestStableToken.sol";
import { ERC1967Proxy } from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

// Echidna invariants for WakuRlnV2 multi-user erasure/reuse (run: echidna-test this.sol --contract EchidnaTest)
contract EchidnaTest {
    WakuRlnV2 internal w;
    TestStableToken internal token;
    address internal tokenOwner = address(this);
    uint32 internal totalRegisteredRate;
    uint32 internal numUsers; // Set in fuzz

    constructor() {
        address tokenImpl = address(new TestStableToken());
        bytes memory tokenInitData = abi.encodeCall(TestStableToken.initialize, (1_000_000 * 10 ** 18));
        address tokenProxyAddr = address(new ERC1967Proxy(tokenImpl, tokenInitData));
        token = TestStableToken(tokenProxyAddr);

        LinearPriceCalculator priceCalculator = new LinearPriceCalculator(address(token), 1e18 / 20); // Example

        address impl = address(new WakuRlnV2());
        bytes memory initData =
            abi.encodeCall(WakuRlnV2.initialize, (address(priceCalculator), 160_000, 20, 600, 15_552_000, 2_592_000));
        address proxyAddr = address(new ERC1967Proxy(impl, initData));
        w = WakuRlnV2(proxyAddr);
    }

    function testEraseAndReuse(uint32 _numUsers, bool fullErase, uint32 rateLimit) public {
        numUsers = _numUsers;

        // Multi-user registers
        totalRegisteredRate = 0;
        for (uint32 i = 1; i <= numUsers; i++) {
            address user = address(uint160(i)); // Simple addresses

            (, uint256 price) = w.priceCalculator().calculate(rateLimit);
            token.mint(user, price);

            // Simulate approval/register (Echidna can't prank, so direct call; assume sender)
            token.approve(address(w), price);
            w.register(i, rateLimit, new uint256[](0));

            totalRegisteredRate += rateLimit;
        }

        require(w.currentTotalRateLimit() == totalRegisteredRate, "Registration invariant failed");

        // Erasures (fuzz numErasures up to numUsers - 1)
        uint32 numErasures = uint32(uint256(keccak256(abi.encodePacked(address(this)))) % (numUsers - 1)) + 1;
        uint256[] memory eraseIds = new uint256[](numErasures);
        bool[] memory erased = new bool[](numUsers + 1);
        uint32 eraseCount = 0;
        while (eraseCount < numErasures) {
            uint32 eraseIdx = uint32(uint256(keccak256(abi.encodePacked(address(this), eraseCount))) % numUsers) + 1;
            if (!erased[eraseIdx]) {
                eraseIds[eraseCount] = eraseIdx;
                erased[eraseIdx] = true;
                eraseCount++;
            }
        }
        uint32 eraser = uint32(uint256(keccak256(abi.encodePacked(address(this)))) % numUsers) + 1;
        w.eraseMemberships(eraseIds, fullErase);

        uint32 erasedRate = numErasures * rateLimit;
        require(w.currentTotalRateLimit() == totalRegisteredRate - erasedRate, "Erasure invariant failed");

        // Reuses
        uint32 numReuses = numErasures;
        for (uint32 i = 0; i < numReuses; i++) {
            uint32 reuser = uint32(uint256(keccak256(abi.encodePacked(address(this), i + numUsers))) % numUsers) + 1;
            address user = address(uint160(reuser));

            (, uint256 price) = w.priceCalculator().calculate(rateLimit);
            token.mint(user, price);

            token.approve(address(w), price);
            uint256 newId =
                100 + uint256(keccak256(abi.encodePacked("new", reuser, address(this), i))) % (w.Q() - 1) + 1;
            w.register(newId, rateLimit, new uint256[](0));
        }

        // Check proofs
        for (uint32 i = 1; i <= numUsers; i++) {
            bool isErased = erased[i];
            uint256 checkId = isErased ? 0 : i;
            if (checkId != 0) {
                (, uint32 idx, uint256 commitment) = w.getMembershipInfo(checkId);
                uint256[20] memory proof = w.getMerkleProof(idx);
                require(_verifyMerkleProof(proof, w.root(), idx, commitment, 20), "Proof invalid");
            }
        }

        require(w.nextFreeIndex() == numUsers, "Index growth invariant failed");
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
}
