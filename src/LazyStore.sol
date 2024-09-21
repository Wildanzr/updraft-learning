// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {SimpleStorage} from "./SimpleStorage.sol";

contract LazyStore is SimpleStorage {
    function storeFavorite(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber * 2;
    }
}
