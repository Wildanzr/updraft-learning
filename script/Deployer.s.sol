// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {Meow} from "../src/Meow.sol";

contract Deployer is Script {
    function run() external returns (Meow) {
        vm.startBroadcast();
        Meow meow = new Meow();
        vm.stopBroadcast();
        return meow;
    }
}

/*
How to run:
    source .env
    forge script --chain sepolia script/Deployer.s.sol:Deployer --rpc-url $BASE_SEPOLIA_RPC_URL --broadcast --verify -vvvv

*/
