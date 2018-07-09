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
  // Store accounts that have voted
  mapping(address => bool) public voters;
  // Fetch Candidate
  // Store Candidates Count
  uint public candidatesCount;

  // voted event
  event votedEvent(
    uint indexed _candidateId
  );
  
  function Election() public {
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  }

  function addCandidate(string _name) private {
    candidatesCount++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }

  function vote(uint _candidateId) public {
    // require that they havent voted before
    require(!voters[msg.sender]);

    // require a valid candidate
    require(_candidateId > 0 && _candidateId <= candidatesCount);

    // record that voter has voted
    voters[msg.sender] = true;

    candidates[_candidateId].voteCount++;

    // trigger voted event
    votedEvent(_candidateId);
  }
  
}