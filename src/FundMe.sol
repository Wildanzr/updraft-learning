// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {AggregatorV3Interface} from "./interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUSD = 5;
    AggregatorV3Interface constant ethUsdPriceFeed = AggregatorV3Interface(0x59F1ec1f10bD7eD9B938431086bC1D9e233ECf41);

    /* 
    @notice This function is used to fund the contract
    @dev User needs to send minimum $5 worth of ETH
    @param 
    @return
    */
    function fund() public payable {
        require(msg.value >= 1e18, "You need to send minimum 1 ETH");
    }

    function withdraw() public {}

    function getPrice() public view returns (uint256) {
        (, int256 price,,,) = ethUsdPriceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}
