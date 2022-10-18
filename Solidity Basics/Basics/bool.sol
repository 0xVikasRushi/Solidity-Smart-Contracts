// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Bool {
    function check(bool val) public pure returns(string memory){
        string memory str;
        if(val){
            str = "The value is true";
           
        }
        else {
         str = "The value is false";
        } 
        return str;
    }
}
