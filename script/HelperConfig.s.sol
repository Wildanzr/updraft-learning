// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "@chainlink/contracts/tests/MockV3Aggregator.sol";

contract HelperConfig is Script {
    Config public activeConfig;

    struct Config {
      address priceFeed;
    }

    constructor() {
      if (block.chainid == 11155111) {
        activeConfig = getSepoliaETHConfig();
      } else {
        activeConfig = getOrCreateAnvilConfig();
      }
    }

    function getSepoliaETHConfig() public pure returns (Config memory) {
        return Config(0x59F1ec1f10bD7eD9B938431086bC1D9e233ECf41);
    }

    function getOrCreateAnvilConfig() private returns (Config memory) {
        if (activeConfig.priceFeed != address(0)) {
            return activeConfig;
        }
        uint8 decimals = 8;
        int256 initialPrice = 2000e8;
        vm.startBroadcast();
        MockV3Aggregator priceFeed = new MockV3Aggregator(decimals, initialPrice);
        vm.stopBroadcast();

        return Config(address(priceFeed));
    }
}