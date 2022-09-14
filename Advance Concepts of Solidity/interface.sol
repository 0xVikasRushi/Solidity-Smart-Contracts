// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

interface ISwitch {
    function switchOn() external returns(uint);
    function switchOff()  external returns(uint);
}

contract Bulb is ISwitch{
    function switchOn() public pure   override returns(uint){
        return 1;
    }
    function switchOff() public pure  override returns(uint){
        return 0;
    }

}

//create Bulb contract here
