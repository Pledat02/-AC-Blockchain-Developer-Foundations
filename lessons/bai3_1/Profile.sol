// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Profile{
    uint public age;
    string public name;
    
    function setProfile(uint _age, string memory _name) public{
        age = _age;
        name = _name;
    }

}