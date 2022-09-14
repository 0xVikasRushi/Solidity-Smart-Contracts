// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract  BankBalanceCheck {
    mapping (address=>uint256) balance;
    address public owner = msg.sender;
    function addBalance(uint Amount) public returns(uint){
        require(msg.sender==owner);
        balance[msg.sender] +=  Amount;
        return balance[msg.sender];
    }

    function checkBalance(address user)  public view returns(uint){
        require(user==owner,"Forbidden : You can't check the balance of other account");
        return balance[user];
    }
    function transfer(address to , uint AmounttoTransfer) public{
        uint fromAddressBalance = checkBalance(msg.sender);
        require(fromAddressBalance>=AmounttoTransfer,"Insufficient Bank Balance");
        require(owner!=to,"you can't send money yourself");
        _transfer(owner,to,AmounttoTransfer);
    }
    function _transfer(address from , address to , uint AmounttoTransfer) public {
        balance[from]-=AmounttoTransfer;
        balance[to]+=AmounttoTransfer;
    }
    //
}