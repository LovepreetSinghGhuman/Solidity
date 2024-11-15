// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    // using public so the variable is readable without writing a getter.

    struct Data {
        uint256 number;         // The number for the address
        string comment;         // The comment associatred with the number
        uint256 blocknumber;    // The  block number when the number was updated
    }
    mapping(address => uint256) public number;

    // Constructor that sets the initial value of the number
    constructor() {
        
    }

    // Event declaration for when the number is updated
    event NumberUpdated(uint256 newNumber);

    // Function to set the number (can be called after contract deployment)
    function setNumber(uint256 newNumber) public {
        number[msg.sender] = newNumber;          // Update the number for the caller
        emit NumberUpdated(newNumber);  // Emit the event
    }
}
