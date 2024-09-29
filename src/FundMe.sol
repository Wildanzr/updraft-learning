// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 5e18;
    address public immutable owner;

    address[] public funders;
    mapping(address funder => uint256 amount) public addressToFundedAmount;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    /**
     * @notice This function is used to fund the contract
     * @dev User needs to send minimum $5 worth of ETH
     */
    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "E:01");
        addressToFundedAmount[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    /**
     * @notice This function is used to withdraw all funds from the contract
     * @dev Resets the funded amount for each funder and transfers the balance to the caller
     */
    function withdraw() public onlyOwner {
        for (uint256 i = 0; i < funders.length;) {
            address funder = funders[i];
            addressToFundedAmount[funder] = 0;
            unchecked {
                i++;
            }
        }
        funders = new address[](0);

        // Via transfer
        // payable(msg.sender).transfer(address(this).balance);

        // Via send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "E:02");

        // Via call
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "E:02");
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
}
