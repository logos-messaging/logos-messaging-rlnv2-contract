// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "../src/LinearPriceCalculator.sol";
import "../src/WakuRlnV2.sol";
import "./TestStableToken.sol";
import { ERC1967Proxy } from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

// Echidna invariants and assertions for WakuRlnV2 multi-user timestamp manipulation races
contract EchidnaTestRaces2 {
    WakuRlnV2 internal w;
    TestStableToken internal token;
    address internal tokenOwner = address(this);

    // Storage for multi-user registrations and their timestamps (to check races per user)
    mapping(uint256 => uint256) internal registrationTimes; // idCommitment => registration timestamp
    uint256[] internal registeredIds; // List of registered IDs for iteration in checks

    // Events for logging timestamps
    event GracePeriodStart(uint256 timestamp);
    event GracePeriodEnd(uint256 timestamp);
    event TimestampBeforeAssertions(uint256 timestamp);

    constructor() {
        address tokenImpl = address(new TestStableToken());
        bytes memory tokenInitData = abi.encodeCall(TestStableToken.initialize, (1_000_000_000 * 10 ** 18));
        address tokenProxyAddr = address(new ERC1967Proxy(tokenImpl, tokenInitData));
        token = TestStableToken(tokenProxyAddr);

        LinearPriceCalculator priceCalculator = new LinearPriceCalculator(address(token), 1e18 / 20); // Example

        address impl = address(new WakuRlnV2());
        bytes memory initData = abi.encodeCall(
            WakuRlnV2.initialize, (address(priceCalculator), 4_294_967_295, 20, 4_294_967_295, 15_552_000, 2_592_000)
        );
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

    // Function to attempt erasure on a random registered membership and assert based on current time
    function attemptErasureRace(uint256 index, bool fullErase) public {
        if (registeredIds.length == 0) return; // Skip if no registrations yet

        uint256 focusId = registeredIds[index % registeredIds.length];
        uint256 regTime = registrationTimes[focusId];
        uint256 activeEnd = regTime + uint256(w.activeDurationForNewMemberships());
        uint256 graceEnd = activeEnd + uint256(w.gracePeriodDurationForNewMemberships());
        emit GracePeriodStart(activeEnd);
        emit GracePeriodEnd(graceEnd);

        bool isActive = (block.timestamp < activeEnd);
        bool isExpired = (block.timestamp >= graceEnd);

        uint256[] memory ids = new uint256[](1);
        ids[0] = focusId;

        bool success = false;
        try w.eraseMemberships(ids, fullErase) {
            success = true;
        } catch { }

        emit TimestampBeforeAssertions(block.timestamp);

        // Additional assertions: State consistency (checked before success to avoid post-erasure state changes)
        assert(w.isExpired(focusId) == isExpired);
        assert(!w.isInGracePeriod(focusId) == (isExpired || isActive));

        // Assertion: Erasure should succeed only if not active (i.e., in grace or expired)
        assert(success == !isActive);
    }
}

