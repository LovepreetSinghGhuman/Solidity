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
contract.on("NumberUpdated", (newNumber) => {
  console.log(`Number updated to ${newNumber}`);
});
