// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Wallet {
    address payable[] public account;
    address payable public owner;

    constructor(address _owner){
        owner=payable(_owner);
        account.push(payable(owner));
    }

    function deposit()  public payable {

    }

    function sendEther(address to,uint amount) public payable {
        require(owner==msg.sender,"sender is not allowed");
        payable(to).transfer(amount);
    }

    function balanceOf() public view returns(uint){
        return address(this).balance;
    }
}
