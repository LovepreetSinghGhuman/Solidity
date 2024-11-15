import {ethers} from "ethers";

let signer;
let provider;

if (window.ethereum == null) {
    console.log("Metamask not installed")
} else {
    provider = new ethers.BrowserProvider(window.ethereum)
    signer = await provider.getSigner();
}