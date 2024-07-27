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

    // Function to deposit Ether into the contract
    function deposit() public payable  onlyOwner {
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
    function setOwner(address newOwner) public {
        require(newOwner != address(0), "New owner address is the zero address");
        owner = newOwner;
        assert(owner == newOwner);
    } 
}
