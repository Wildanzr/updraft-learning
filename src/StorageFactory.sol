//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        listOfSimpleStorageContracts.push(new SimpleStorage());
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _favoriteNumber) public {
        SimpleStorage current = listOfSimpleStorageContracts[_simpleStorageIndex];
        current.storeFavorite(_favoriteNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        SimpleStorage current = listOfSimpleStorageContracts[_simpleStorageIndex];
        return current.favoriteNumber();
    }
}
