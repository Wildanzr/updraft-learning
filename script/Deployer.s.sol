// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {Meow} from "../src/Meow.sol";
import {FundMe} from "../src/FundMe.sol";

contract Deployer is Script {
    function run() external returns (FundMe) {
        vm.startBroadcast();
        FundMe fundMe = new FundMe();
        vm.stopBroadcast();
        return fundMe;
    }
}

/*
How to run:
    source .env
    forge script --chain sepolia script/Deployer.s.sol:Deployer --rpc-url $BASE_SEPOLIA_RPC_URL --broadcast --verify -vvvv
*/
