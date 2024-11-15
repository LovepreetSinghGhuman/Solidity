// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    uint public number;

    function setNumb(uint numb) public {
        require(numb >= 0);
        number = numb; 
    } 

    function getNumb() public view returns(uint) {
        return number;
    }
}