// SPDX-License-Identifier: MIT

// deployed on https://ropsten.etherscan.io/tx/0x81b74988d020ea5ca7374d5d328fdde5122171e7b89f76bc72b3cb522686c427


pragma solidity >=0.5.0 <0.9.0;
contract VendingMachine{

    address payable public owner;
    mapping (address=>uint) public donutBalance;


    constructor(){
        owner = payable(msg.sender);
        donutBalance[address(this)] = 100;
    }
    function getBalance() public view returns(uint){
        return donutBalance[address(this)];
    }
    event purchased(address seller, uint Quantity);
    event restocked(string info, uint DonutCount);

    function purchase(uint Quantity) public payable{
        // require(Quantity*2<=msg.value,"please pay extact amount"); // buyer doesnt know extact amount
        require(owner!=msg.sender,"you can't buy yourself");
        require(msg.value >=  Quantity * 2 ether,"Insuffient funds you must pay 2 ether  per one donut");
        require(donutBalance[address(this)]>=Quantity,"Insuffient donuts. send a msg to owner to restock");
        donutBalance[address(this)] -= Quantity;
        donutBalance[msg.sender]    += Quantity;
        owner.transfer(msg.value);
        emit purchased(msg.sender,Quantity);
    }

    function restock(uint Amount) public{
        require(owner==msg.sender,"You are not allowed to restock");
        donutBalance[address(this)] += Amount;
        emit restocked("Owner restock the vending machine",Amount);
    }




}

