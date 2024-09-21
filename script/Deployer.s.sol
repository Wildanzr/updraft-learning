// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";

contract Deployer is Script {
    function run() external {
        uint256 deployerPK = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPK);

        // new SimpleStorage();
        vm.stopBroadcast();
    }
}

/*
How to run:
    source .env
    forge script --chain sepolia script/Deployer.s.sol:Deployer --rpc-url $BASE_SEPOLIA_RPC_URL --broadcast --verify -vvvv

*/
