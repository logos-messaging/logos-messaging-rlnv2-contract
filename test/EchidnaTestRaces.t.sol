// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "../src/LinearPriceCalculator.sol";
import "../src/WakuRlnV2.sol";
import "../src/Membership.sol"; // Added import for MembershipUpgradeable
import "./TestStableToken.sol";
import { ERC1967Proxy } from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

// Echidna invariants and assertions for WakuRlnV2 multi-user timestamp manipulation races
contract EchidnaTestRaces {
    WakuRlnV2 internal w;
    TestStableToken internal token;
    address internal tokenOwner = address(this);

    // Storage for multi-user registrations (to track registered IDs)
    uint256[] internal registeredIds;

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

        // Add to list (only if successful; reverts otherwise)
        registeredIds.push(idCommitment);
    }

    // Function to attempt extension on a random registered membership and assert based on current time
    function attemptExtensionRace(uint256 index) public {
        if (registeredIds.length == 0) return; // Skip if no registrations yet

        uint256 focusId = registeredIds[index % registeredIds.length];

        // Query current membership info from contract to handle updates (e.g., from extensions)
        MembershipUpgradeable.MembershipInfo memory info;
        (
            info.depositAmount,
            info.activeDuration,
            info.gracePeriodStartTimestamp,
            info.gracePeriodDuration,
            info.rateLimit,
            info.index,
            info.holder,
            info.token
        ) = w.memberships(focusId);

        // If membership doesn't exist (e.g., erased), skip
        if (info.rateLimit == 0) return;

        uint256 graceStart = info.gracePeriodStartTimestamp;
        uint256 graceEnd = graceStart + uint256(info.gracePeriodDuration);
        bool isInGrace = (block.timestamp >= graceStart && block.timestamp < graceEnd);
        bool isExpired = (block.timestamp >= graceEnd);

        // Additional assertions: State consistency (pre-operation)
        assert(w.isInGracePeriod(focusId) == isInGrace);
        assert(w.isExpired(focusId) == isExpired);

        uint256[] memory ids = new uint256[](1);
        ids[0] = focusId;

        bool success = false;
        try w.extendMemberships(ids) {
            success = true;
        } catch { }

        // Assertion: Extension should succeed only if in grace period (and sender is holder, but always true here)
        assert(success == isInGrace);
    }

    // Function to attempt erasure on a random registered membership and assert based on current time
    function attemptErasureRace(uint256 index, bool fullErase) public {
        if (registeredIds.length == 0) return; // Skip if no registrations yet

        uint256 focusId = registeredIds[index % registeredIds.length];

        // Query current membership info from contract to handle updates
        MembershipUpgradeable.MembershipInfo memory info;
        (
            info.depositAmount,
            info.activeDuration,
            info.gracePeriodStartTimestamp,
            info.gracePeriodDuration,
            info.rateLimit,
            info.index,
            info.holder,
            info.token
        ) = w.memberships(focusId);

        // If membership doesn't exist (e.g., already erased), skip
        if (info.rateLimit == 0) return;

        uint256 graceStart = info.gracePeriodStartTimestamp;
        uint256 activeEnd = graceStart; // graceStart is end of active
        uint256 graceEnd = graceStart + uint256(info.gracePeriodDuration);

        bool isActive = (block.timestamp < activeEnd);
        bool isExpired = (block.timestamp >= graceEnd);

        // Additional assertions: State consistency (pre-operation)
        assert(w.isExpired(focusId) == isExpired);
        assert(w.isInGracePeriod(focusId) == !(isExpired || isActive));

        uint256[] memory ids = new uint256[](1);
        ids[0] = focusId;

        bool success = false;
        try w.eraseMemberships(ids, fullErase) {
            success = true;
        } catch { }

        // Assertion: Erasure should succeed only if not active (i.e., in grace or expired)
        // (and for grace, sender == holder, but always true here)
        assert(success == !isActive);

        // If successful erasure, remove from local registeredIds to avoid stale entries
        if (success) {
            // Find and remove focusId from array (swap with last and pop)
            for (uint256 i = 0; i < registeredIds.length; i++) {
                if (registeredIds[i] == focusId) {
                    registeredIds[i] = registeredIds[registeredIds.length - 1];
                    registeredIds.pop();
                    break;
                }
            }
        }
    }
}
