//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Polymorphism {
    function sub(int a, int b) public pure returns(int){
        return a-b;
    }
    function sub(int a, int b ,int c) public pure returns(int){
        return a-b-c;
    }
}
