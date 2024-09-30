// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Meow is Ownable {
    uint256 meowCount;

    constructor() Ownable(msg.sender) {}

    function meow() public returns (string memory) {
        meowCount++;
        return "Meow miaww moeewww";
    }
}
