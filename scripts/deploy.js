const hre = require("hardhat");

async function main() { 
  const DigitalPetStore = await hre.ethers.getContractFactory("DigitalPetStore");
  const digitalPetStore = await DigitalPetStore.deploy();

  await digitalPetStore.deployed();

  digitalPetStore.on("Deposit", (owner, amount) => {
    console.log(`New deposit: ${owner} ${amount} WEI`);
  });

  digitalPetStore.on("Withdraw", (owner, amount) => {
    console.log(`New withdraw: ${owner} ${amount} WEI`);
  });

  digitalPetStore.on("PetBought", (buyer) => {
    console.log(`New pet bought by: ${buyer}`);
  });

  digitalPetStore.on("PetSold", (seller) => {
    console.log(`Pet sold by: ${seller}`);
  });

  console.log(`Contract deployed to ${digitalPetStore.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
