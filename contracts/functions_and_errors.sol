// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract DigitalPetStore {

    mapping(address => uint) private balances;
    mapping(address => bool) private ownsPet;

    event Deposit(address indexed owner, uint amount);
    event Withdraw(address indexed owner, uint amount);
    event PetBought(address indexed buyer);
    event PetSold(address indexed seller);

    function deposit(address _account, uint _number) public payable {
        uint previousBalance = balances[_account];
        balances[_account] += _number;
        emit Deposit(_account, _number);
        assert(balances[_account] >= previousBalance && balances[_account] >= _number); 
    }

    function withdraw(address _account, uint _number) public payable {
        require(balances[_account] >= _number, "You do not have the required funds to withdraw.");
        balances[_account] -= _number;
        emit Withdraw(_account, _number);
    }

    function getBalance(address _address) public view returns(uint) {
        return balances[_address];
    }

    function buyPet() public {
        uint petPrice = 1 wei;

        require(!ownsPet[msg.sender] , "You already own a pet.");

        if (balances[msg.sender] < petPrice) {
            revert("Insufficient balance to buy the pet.");
        }

        balances[msg.sender] -= petPrice;
        ownsPet[msg.sender] = true;
        
        emit PetBought(msg.sender);

        assert(ownsPet[msg.sender] == true);
    }

    function sellPet() public {
        uint petPrice = 1 wei;
        require(ownsPet[msg.sender], "You do not own a pet to sell.");

        ownsPet[msg.sender] = false;
        balances[msg.sender] += petPrice;

        emit PetSold(msg.sender);

        assert(ownsPet[msg.sender] == false);
    }
}
