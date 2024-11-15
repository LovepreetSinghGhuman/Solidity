import {ethers} from "ethers";

let signer;
let provider;

if (window.ethereum == null) {
    console.log("Metamask not installed")
} else {
    provider = new ethers.BrowserProvider(window.ethereum)
    signer = await provider.getSigner();
}

const contract = new ethers.Contract(contractAddress, abi, provider);

// Listen for NumberUpdated events
contract.on('NumberUpdated', (user, newNumber, comment, blockNumber) => {
    console.log(`User ${user} updated their number to ${newNumber}`);
    console.log(`New comment: ${comment}`);
    console.log(`Block number: ${blockNumber}`);
});