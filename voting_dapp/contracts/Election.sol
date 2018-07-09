pragma solidity ^0.4.11;

contract Election {

  // Model a Candidate
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  // Store Candidates
  mapping(uint => Candidate) public candidates;
  // Fetch Candidate
  // Store Candidates Count
  uint public candidatesCount;
  
  function Election() public {
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  }

  function addCandidate(string _name) private {
    candidatesCount++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }
  
}