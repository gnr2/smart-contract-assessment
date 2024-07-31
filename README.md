# smart-contract-assessment
Metacrafters Functions and Errors - ETH + AVAX Project 1


# BankContract
### Description
This is a simple Solidity smart contract that allows an owner to deposit and withdraw Ether, with balance tracking. This project demonstrates the usage of `require()`, `assert()`, and `revert()` statements in Solidity.

## Features

- **Deposit Ether:** The owner can deposit Ether into the contract.
- **Withdraw Ether:** The owner can withdraw a specified amount of Ether from the contract.
- **Set New Owner:** The current owner can set a new owner for the contract.

### Functions

1. **deposit()**
    - Allows the owner to deposit Ether into the contract.
    - Uses `require()` to ensure the deposit amount is greater than zero.
    - Updates the owner's balance.

2. **withdraw(uint256 amount)**
    - Allows the owner to withdraw a specified amount of Ether from the contract.
    - Uses `revert()` to handle insufficient balance.
    - Uses `assert()` to ensure the balance is correctly updated after withdrawal.

3. **setOwner(address newOwner)**
    - Allows the current owner to set a new owner.
    - Uses `require()` to ensure the new owner's address is not the zero address.
    - Uses `assert()` to ensure the new owner is correctly set.


## Getting Started
### Executing the Programg

This contract was developed and tested using the [Remix IDE](https://remix.ethereum.org/) with Solidity version ^0.8.0. 

To run the program, compile the file in [Remix IDE](https://remix.ethereum.org/) after selecting the Solidity compiler tool on the navigation bar and selecting a matching compiler version (^0.8.0). Then, deploy the contract with a valid address on the deploy tool. 

Once the contract is deployed you can start experimenting on the functions.

To call the functions: `deposit` and `withdraw`, an owner must first be set to a valid address using the `setOwner` function. You can set the account used to deploy the contract as the owner address or choose any valid addresses provided by the Remix IDE.

## Authors
Gener Ellis David <br>
[@gnr2](https://github.com/gnr2)

## License
This project is licensed under the MIT License - see the LICENSE.md file for details


