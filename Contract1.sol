// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NumberStorage {
    // Struct to hold the data for each address
    struct Data {
        uint256 number;             // The number for the address
        string comment;             // The comment associated with the number
        uint256 blockNumber;        // The block number when the number was updated
    }

    // Mapping to store the data for each address
    mapping(address => Data) public userData;

    // Event declaration for when a number is updated
    event NumberUpdated(address indexed user, uint256 oldNumber, uint256 newNumber, string oldComment, string newComment, uint256 blockNumber);

    // Constructor to set initial data for the contract deployer
    constructor(uint256 initialNumber, string memory initialComment) {
        // Set the initial data for the contract deployer (msg.sender)
        dataStore[msg.sender] = Data({
            number: initialNumber,
            comment: initialComment,
            blockNumber: block.number
        });
        // Emit an event to log the initial data for the deployer
        emit NumberUpdated(msg.sender, 0, initialNumber, "", initialComment, block.number);
    }

    // Function to set the number and the comment for the caller (only the caller can update their own data)
    function setNumber(uint256 newNumber, string calldata newComment) public {
        // Get the old data for the caller
        Data storage userData = dataStore[msg.sender];
        uint256 oldNumber = userData.number;
        string memory oldComment = userData.comment;

        // Update the data for the caller
        userData.number = newNumber;
        userData.comment = newComment;
        userData.blockNumber = block.number;  // Store the block number when the update happens

        // Emit the event with the user's address, old data, new data, and the block number
        emit NumberUpdated(msg.sender, oldNumber, newNumber, oldComment, newComment, block.number);
    }
}
