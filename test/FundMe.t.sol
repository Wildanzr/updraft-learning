// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe public fundMe;

    function setUp() public {
        fundMe = new FundMe();
    }

    function testMaxCorrect() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testFailNotOwner() public {
        vm.prank(address(1));
        fundMe.withdraw();
    }
}
