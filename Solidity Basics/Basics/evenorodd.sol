pragma solidity >=0.5.0 <0.9.0;
// SPDX-License-Identifier: MIT

contract IfElse{
    function checkEvenOdd(int num) public pure returns(string memory){
        string memory str;
        if(num<0){
        str = "Please enter a positive number";
        }
        else if(num%2==0){
        str = "Number is even";
        }
        else {
        str = "Number is odd";
        }
        return str;
    }
}
