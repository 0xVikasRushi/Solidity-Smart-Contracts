// SPDX-License-Identifier: MIT 

pragma solidity >=0.5.0 <0.9.0;
contract functionIntro{
    uint public age = 18; // state var
    // function getter() public pure returns(uint){
    //     uint public num=20;
    //     string memory name ="vikas"; // we use memory to store in own pc not in blockchain storage with is coslty 
    //     return num;
    // }
    function increment() public{
         age+=1;
    } 
    function setter(uint newage) public{
        age = newage; // changing state var it cost the gas
    }
    uint public statevar = 10;
    function returnStateVariable() view public returns(uint){
     return statevar;
    }
    function returnLocalVariable() pure public returns(uint){
        uint local = 20;
        return local;
    }
 }