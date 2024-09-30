// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {Meow} from "../src/Meow.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {console} from "forge-std/Test.sol";

contract Deployer is Script {
    function run() external returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig();
        address priceFeed = helperConfig.activeConfig();
        console.log("PriceFeed", priceFeed);
        vm.startBroadcast();
        FundMe fundMe = new FundMe(priceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}

/*
How to run:
    source .env
    forge script --chain sepolia script/Deployer.s.sol:Deployer --rpc-url $BASE_SEPOLIA_RPC_URL --broadcast --verify -vvvv
*/
