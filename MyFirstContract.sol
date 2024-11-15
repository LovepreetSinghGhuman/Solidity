// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    // using public so the variable is readable without writing a getter.
    uint256 public number;

    // Constructor that sets the initial value of the number
    constructor(uint256 initNumb) {
        number = initNumb;
    }

    // Event declaration for when the number is updated
    event NumberUpdated(uint256 newNumber);

    // Function to set the number (can be called after contract deployment)
    function setNumber(uint256 newNumber) public {
        number = newNumber;
        emit NumberUpdated(newNumber);  // Emit the event
    }
}
