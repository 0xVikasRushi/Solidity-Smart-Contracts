
/*
it is live deployed on ropsten test network block info
//https://ropsten.etherscan.io/tx/0xae1a7c9744d65e6998b87b45c6641eec65423bd949a7a092de2575f47394e0e9
*/

// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;


contract Ecommerce{
    struct Product{
        string name;
        uint price;
        uint productId;
        string desc;
        address payable seller;
        address buyer;
        bool isDelived;
    }
    uint public counter=1;

    // events
    event registered(string  name,uint productId,address Seller);
    event bought(uint productId,address buyer);
    event isDeliver(uint productId) ;

    address payable public manager;
    constructor(){
        manager = payable(msg.sender);
    }

    bool isDestoryed=false;
    modifier notDestoryed {
        require(!isDestoryed,"contract does not exit");
        _;
    }

    Product[] public Products;
    function registerProduct(string memory _name,string memory _desc,uint _prices) public notDestoryed  {
        require(_prices>0,"Invaild Price");
        Product memory temp;
        temp.name = _name;
        temp.desc = _desc;
        temp.price = _prices * 10**18;
        temp.seller = payable(msg.sender);
        temp.isDelived = false;
        temp.productId = counter;
        Products.push(temp);
        counter++;
        emit registered(_name,temp.productId,msg.sender);
    }
    function buy(uint _productid) notDestoryed public payable {
        require(Products[_productid-1].price == msg.value,"Invaild Amount Please Pay the extact price");
        require(Products[_productid-1].seller!=msg.sender,"Seller can't be buyer");
        Products[_productid-1].buyer = msg.sender;
        emit bought(_productid,msg.sender);
    }
    function isDelived(uint _id) notDestoryed public{
        require(Products[_id-1].buyer==msg.sender,"You can't check");
        Products[_id-1].isDelived = true;
        Products[_id-1].seller.transfer(Products[_id-1].price);
        emit isDeliver (_id);
    }
    // function destroy() public {
    //     require(manager==msg.sender,"only manager can destroy the contract");
    //     selfdestruct(manager);
    // }

    function destroy() public notDestoryed {
        require(manager==msg.sender,"only manager can destroy the contract");
        manager.transfer(address(this).balance);
        isDestoryed=true;
    }

    // sending this own to money 

    fallback() payable external{
        payable(msg.sender).transfer(msg.value);
    }


}