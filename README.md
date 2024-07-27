# smart-contract-assessment
Metacrafters Functions and Errors - ETH + AVAX Project 1


# BankContract

This is a simple Solidity smart contract that allows an owner to deposit and withdraw Ether, with balance tracking. This project demonstrates the usage of `require()`, `assert()`, and `revert()` statements in Solidity.

## Features

- **Deposit Ether:** The owner can deposit Ether into the contract.
- **Withdraw Ether:** The owner can withdraw a specified amount of Ether from the contract.
- **Set New Owner:** The current owner can set a new owner for the contract.

## Usage

This contract was developed and tested using the [Remix IDE](https://remix.ethereum.org/) with Solidity version 0.8.0.

To call the functions: `deposit` and `withdraw`, an owner must first be set to a valid address using the `setOwner` function. You can set the account used to deploy the contract as the owner address.

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

### Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankContract {

    address public owner;
    mapping(address => uint256) public balances;

    // Modifier to check if the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    // Constructor to set the contract deployer as the initial owner
    constructor() {
        owner = msg.sender;
    }

    // Function to deposit Ether into the contract
    function deposit() public payable onlyOwner {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[owner] += msg.value; // Update owner's balance
    }

    // Function to withdraw a specified amount of Ether from the contract
    function withdraw(uint256 amount) public onlyOwner payable {
        if(amount > balances[owner]){
            revert("Insufficient Balance");
        }
        uint256 oldBalance = balances[owner];
        balances[owner] -= amount;
        payable(owner).transfer(amount);
        assert(balances[owner] == oldBalance - amount);
    }

    // Function to set a new owner
    function setOwner(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner address is the zero address");
        owner = newOwner;
        assert(owner == newOwner);
    }
}
