//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

contract SimpleStorage {
    struct Person {
        string name;
        uint256 luckyNumber;
    }

    uint256 public favoriteNumber = 0;
    mapping(address => Person) public addressToFavouriteNumber;

    function storeFavorite(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    function storePersonFavorite(string memory _name, uint256 _luckyNumber) public {
        Person memory person = Person(_name, _luckyNumber);
        addressToFavouriteNumber[msg.sender] = person;
    }

    function retrievePersonFavorite() public view returns (Person memory) {
        return addressToFavouriteNumber[msg.sender];
    }
}
