// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 < 0.9.0;


contract FunctionArgument{
    uint num;
    function set(uint n) public{
        num=n;
    }
    function get() public view returns(uint){
        return num;
    }
}
