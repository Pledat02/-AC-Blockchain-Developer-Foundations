// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract Voting{
    struct Candidate {
        string  name;
        uint voteCount;
    }
    address public owner;

    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public hasVoted;
    uint public candidatesCount;
    constructor() {
        owner = msg.sender;
      
    }
    error OnlyOwner();

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert OnlyOwner();
        }
        _;
    }

    event Voted(address voter, uint candidateId);

    function addCantidate(string memory name) public onlyOwner {
       candidates[candidatesCount] = Candidate(name, 0);
        candidatesCount++;
    }
    function vote(uint candidateId) public {

        if (hasVoted[msg.sender]) revert("You have already voted");

        candidates[candidateId].voteCount++;
        hasVoted[msg.sender] = true;
        emit Voted(msg.sender, candidateId);
    }
        
}