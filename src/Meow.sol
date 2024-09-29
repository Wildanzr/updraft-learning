// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract Meow {
    uint256 meowCount;

    function meow() public returns (string memory) {
        meowCount++;
        return "Meow miaww!";
    }
}
