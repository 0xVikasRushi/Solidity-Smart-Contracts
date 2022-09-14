// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Parent {
    int public i;
    function increment() public {
        i=i+1;
    }
}

//Create Child Contract
contract Child is Parent{

    function decrement() public{
        i = i-1;
    }


}