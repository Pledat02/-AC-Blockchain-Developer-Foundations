 // SPDX-License-Identifier: MIT
 pragma solidity >=0.8.0;

contract VotingEligibility{
     address public owner; 
     uint private minAge = 18;
    constructor() {
        owner = msg.sender;
    }
    function checkEligibility(uint age) public view returns (bool){
        if(age >= minAge){
            return true;
        }else{
            return false;
        }
    }
    function updateMinAge(uint _minAge) public {
        require(msg.sender == owner ,"only owner allows to update min age");
        minAge = _minAge;
    }
}