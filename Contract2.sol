// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SafeCollectible 
{
    // Mapping from token ID to owner's address
    mapping(uint256 => address) private _owners;

    // Event to log minting of a new collectible
    event Minted(address indexed from, address indexed to, uint256 indexed tokenId);

    // Event to log transfers of collectibles
    event Transferred(address indexed from, address indexed to, uint256 indexed tokenId);

    // Minting fee (in wei)
    uint256 public constant MINTING_FEE = 0.01 ether;

    // Function to mint a new collectible
    function mint(uint256 tokenId) public payable {
        require(_owners[tokenId] == address(0), "Token already owned");
        require(msg.value >= MINTING_FEE, "Insufficient payment for minting");

        _owners[tokenId] = msg.sender;

        emit Minted(address(0), msg.sender, tokenId);
    }

    // Function to transfer a collectible to a new owner
    function transfer(uint256 tokenId, address to) public {
        require(_owners[tokenId] == msg.sender, "Caller is not the owner");
        require(to != address(0), "Cannot transfer to zero address");

        _owners[tokenId] = to;

        emit Transferred(msg.sender, to, tokenId);
    }

    // Function to check the owner of a specific token
    function ownerOf(uint256 tokenId) public view returns (address) {
        address owner = _owners[tokenId];
        require(owner != address(0), "Token does not exist");
        return owner;
    }

    // Function to withdraw collected fees, restricted to the contract owner
    function withdraw() public {
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success, "Withdrawal failed");
    }
}
