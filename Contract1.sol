// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NumberStorage {
    // Struct to store the number, comment, and block number
    struct UserData {
        uint256 number;
        string comment;
        uint256 blockNumber;
    }

    // Mapping to store UserData for each address
    mapping(address => UserData) public userData;

    // Event to notify when a number is updated
    event NumberUpdated(address user, uint256 newNumber, string comment, uint256 blockNumber);

    // Constructor - Optional: initialize data for the contract deployer
    constructor(uint256 _initialNumber, string memory _initialComment) {
        userData[msg.sender] = UserData({
            number: _initialNumber,
            comment: _initialComment,
            blockNumber: block.number
        });
        emit NumberUpdated(msg.sender, _initialNumber, _initialComment, block.number);
    }

    // Function to set the number and comment for the caller's address
    function setNumber(uint256 _newNumber, string memory _newComment) public {
        // Fetch the old user data
        UserData storage data = userData[msg.sender];

        // Update the user's data
        data.number = _newNumber;
        data.comment = _newComment;
        data.blockNumber = block.number;

        // Emit the event with the updated data
        emit NumberUpdated(msg.sender, _newNumber, _newComment, block.number);
    }
}
