import {ethers} from "ethers";

let signer;
let provider;

if (window.ethereum == null) {
    console.log("Metamask not installed")
} else {
    provider = new ethers.BrowserProvider(window.ethereum)
    signer = await provider.getSigner();
}

const contract = new ethers.Contract(contractAddress, contractABI, provider);

// Listen for the NumberUpdated event
contract.on("NumberUpdated", (user,newNumber) => {
  console.log(`User ${user} Number updated to ${newNumber}`);
});
