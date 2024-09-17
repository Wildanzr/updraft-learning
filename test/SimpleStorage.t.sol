//SPDX-License-Identifier: UNLICENSED

import {Test, console} from "forge-std/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

pragma solidity 0.8.20;

contract SimpleStorageTest is Test {
    SimpleStorage public simpleStorage;

    function setUp() public {
        simpleStorage = new SimpleStorage();
    }

    function testInit() public view {
        assertEq(simpleStorage.favoriteNumber(), 0);
    }

    function testChangeFavoriteNumber() public {
        simpleStorage.storeFavorite(10);
        assertEq(simpleStorage.favoriteNumber(), 10);
    }

    function testAddPerson() public {
        simpleStorage.storePersonFavorite("Alice", 7);
        SimpleStorage.Person memory person = simpleStorage.retrievePersonFavorite();
        assertEq(person.name, "Alice");
        assertEq(person.luckyNumber, 7);
    }
}
