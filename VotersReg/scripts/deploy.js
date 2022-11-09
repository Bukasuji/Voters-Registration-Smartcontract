// Import ethers from Hardhat package
const { ethers } = require("hardhat");

async function main() {
 
  const voteContract = await ethers.getContractFactory("VotersRegister");

  // here we deploy the contract
  const deployedVoteContract = await voteContract.deploy();

  // wait for the contract to deploy
  await deployedVoteContract.deployed();

  // print the address of the deployed contract
  console.log("Vote Contract Address:", deployedVoteContract.address);
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });