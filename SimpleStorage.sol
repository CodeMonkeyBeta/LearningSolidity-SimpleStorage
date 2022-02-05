// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleStorage {

    // this will get initialized to 0!
    uint256 public favoriteNumber;
    bool favoriteBool;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;
    // Mapping a dictionary like data stucture with 1 value per key
    //some type of key and spites out some type of verible that its mapped to 
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    //view, pure functiond do not change the state of the blockchain
    //
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    //memory or storage tells function what to to with the data?
    //memory = keep this veriable only for this exicution(delete after exicute)
    //storage = data will persist even after function exicutes(keep forever)
    function addPerson(string memory _name, uint256 _favoriteNumber) public { 
        people.push(People({favoriteNumber: _favoriteNumber, name: _name}));
        nameToFavoriteNumber[_name] = _favoriteNumber;

    }
}
