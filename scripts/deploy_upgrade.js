const { ethers, upgrades } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log(
    "Deploying the contracts with the account:",
    await deployer.getAddress()
  );
  const TokenV1 = await ethers.getContractFactory("TokenV1", []);
  const tokenV1 = await upgrades.deployProxy(TokenV1);
  await tokenV1.deployed();
  console.log("TokenV1 deployed at", tokenV1.address);
}

main();
