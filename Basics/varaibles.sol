// SPDX-License-Identifier: MIT 

pragma solidity >=0.5.0 <0.9.0;


contract variables{
    string public name;
    bool public major;
    uint public age; 
    // unsigned integer only +ve
    // uint -- uint256  0 to  2**256-1
    // uint8 - uint8  0 to 2**8-1
    // uint16 - 0 to 2**16-1


    int public range; // int range (-2**255,2**255-1)
     int public minage = type(int).min;
    int public maxage = type(int).max;

    address public myethadress;
    bytes32 public b32;

    


    constructor(){
        name = "vikas";
        age=19;
         major=false;
        
       
    }
  
   
}