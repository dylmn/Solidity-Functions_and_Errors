//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract SampleBank {

    mapping(address => uint) private balances;

    event Deposit(address indexed owner, uint amount);
    event Withdraw(address indexed owner, uint amount);
    event Transfer(address indexed from, address indexed to, uint amount);

    function deposit(address _account, uint _number) public payable {
        uint previousBalance = balances[_account];
        balances[_account] += _number;
        emit Deposit(_account, _number);
        assert(balances[_account] >= previousBalance && balances[_account] >= _number); 
    }

    function withdraw(address _account, uint _number) public payable {
        require(balances[_account] >= _number, "You do not have the Required funds to withdraw.");
        balances[_account] -= _number;
        emit Withdraw(_account, _number);
    }

    function transfer(address _sender, address _receiver, uint _number) public payable {
        balances[_sender] -= _number;
        balances[_receiver] += _number;
        if (balances[_sender] < _number) {
            revert("Reverting: You do not have enough funds for this transaction");
        }
        emit Transfer(_sender, _receiver, _number);
    }

    function getBalance(address _address) public view returns(uint) {
        return balances[_address];
    } 
}