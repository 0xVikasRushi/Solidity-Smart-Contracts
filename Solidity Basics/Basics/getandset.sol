// SPDX-License-Identifier: MIT 

pragma solidity >=0.5.0 <0.9.0;
contract getterandsetter {
    int number;
    constructor(){
        number=10;
    }
    function gettervalue() public view returns(int){
        return number;
    }
    function increment() public{
        number+=2;
    }

}