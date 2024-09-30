// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {Deployer} from "../script/Deployer.s.sol";

contract FundMeTest is Test {
    FundMe public fundMe;

    function setUp() public {
        // fundMe = new FundMe(0x59F1ec1f10bD7eD9B938431086bC1D9e233ECf41);
        Deployer deployer = new Deployer();
        fundMe = deployer.run();
    }

    function testMaxCorrect() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testFailNotOwner() public {
        vm.prank(address(1));
        fundMe.withdraw();
    }

    function testVersion() public view {
        console.log("Version", fundMe.getVersion());
        assertEq(fundMe.getVersion(), 4);
    }
}
