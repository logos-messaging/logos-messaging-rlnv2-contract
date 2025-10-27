// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "../src/LinearPriceCalculator.sol";
import "../src/WakuRlnV2.sol";
import "./TestStableToken.sol";
import { ERC1967Proxy } from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

// Echidna invariants and assertions for WakuRlnV2 multi-user timestamp manipulation races
contract EchidnaTest {
    WakuRlnV2 internal w;
    TestStableToken internal token;
    address internal tokenOwner = address(this);

    // Storage for multi-user registrations and their timestamps (to check races per user)
    mapping(uint256 => uint256) internal registrationTimes; // idCommitment => registration timestamp
    uint256[] internal registeredIds; // List of registered IDs for iteration in checks

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

    // Function to register a single membership; Echidna can call this multiple times with time advances between
    function registerMembership(uint256 idCommitment, uint32 rateLimit) public {
        (, uint256 price) = w.priceCalculator().calculate(rateLimit);
        token.mint(address(this), price);
        token.approve(address(w), price);
        w.register(idCommitment, rateLimit, new uint256[](0));

        // Store registration time and add to list
        registrationTimes[idCommitment] = block.timestamp;
        registeredIds.push(idCommitment);
    }

    // Function to attempt extension on a random registered membership and assert based on current time
    function attemptExtensionRace(uint256 index) public {
        if (registeredIds.length == 0) return; // Skip if no registrations yet

        uint256 focusId = registeredIds[index % registeredIds.length];
        uint256 regTime = registrationTimes[focusId];
        uint256 graceStart = regTime + uint256(w.activeDurationForNewMemberships());
        uint256 graceEnd = graceStart + uint256(w.gracePeriodDurationForNewMemberships());

        bool isInGrace = (block.timestamp >= graceStart && block.timestamp < graceEnd);
        bool isExpired = (block.timestamp >= graceEnd);

        uint256[] memory ids = new uint256[](1);
        ids[0] = focusId;

        bool success = false;
        try w.extendMemberships(ids) {
            success = true;
        } catch { }

        // Assertion: Extension should succeed only if in grace period
        assert(success == isInGrace);

        // Additional assertions: State consistency
        assert(w.isInGracePeriod(focusId) == isInGrace);
        assert(w.isExpired(focusId) == isExpired);
    }

    // Function to attempt erasure on a random registered membership and assert based on current time
    function attemptErasureRace(uint256 index, bool fullErase) public {
        if (registeredIds.length == 0) return; // Skip if no registrations yet

        uint256 focusId = registeredIds[index % registeredIds.length];
        uint256 regTime = registrationTimes[focusId];
        uint256 activeEnd = regTime + uint256(w.activeDurationForNewMemberships());
        uint256 graceEnd = activeEnd + uint256(w.gracePeriodDurationForNewMemberships());

        bool isActive = (block.timestamp < activeEnd);
        bool isExpired = (block.timestamp >= graceEnd);

        uint256[] memory ids = new uint256[](1);
        ids[0] = focusId;

        bool success = false;
        try w.eraseMemberships(ids, fullErase) {
            success = true;
        } catch { }

        // Assertion: Erasure should succeed only if not active (i.e., in grace or expired)
        assert(success == !isActive);

        // Additional assertions: State consistency
        assert(w.isExpired(focusId) == isExpired);
        assert(!w.isInGracePeriod(focusId) == (isExpired || isActive));
    }

    // Helper for proof verification (if needed in future expansions)
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
