# Solidity-Functions_and_Errors

This Solidity smart contract showcases various functions and their usage, along with error handling practices.

## Description

The smart contract serves as a demonstration of functions typical in blockchain applications. It provides capabilities for depositing, withdrawing, and transferring balances between addresses. Each function is also designed to ensure the integrity and security of funds through error handling mechanisms.

## Getting Started

### Installing

To set up and interact with this contract using Hardhat, Node js, and VSCode, follow these steps:
* Setup Node JS on your project folder using
```
npm init
```
* Initialize Hardhat in your project folder with
```
npx hardhat
```
* Download or copy the following codes in your respective contracts/.sol and scripts/deploy.js file
* Configure your hardhat.config.js or follow what I used
```
require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
};
```
### Executing program

* Open three additional terminals in your VS code
* In the second terminal type: npx hardhat node
* In the third terminal, type: npx hardhat run --network localhost scripts/deploy.js
* In the first terminal, type: npx hardhat console --network localhost
* Then we'll use this command to attach our smart contract to our console: const bank = await (await ethers.getContractFactory("Bank")).attach("0x5FbDB2315678afecb367f032d93F642f64180aa3")

Once the contract is attached, you can go ahead and call the smart contract functions!

Here are some examples you can run using our hardhat provided accounts:
* await bank.deposit("0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266", 1)
* await bank.getBalance("0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266")

credits from: https://github.com/MetacrafterChris/event-challenge/tree/main

### Help
For common problems or issues, consider the following tips:
* Check that you have the correct address that you want to deposit/withdraw/transfer tokens on.
* If errors occur on regarding values being transacted, lines of error might show up due to the use of error handling.

## Authors

Contributors names and contact info

https://github.com/dylmn

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
