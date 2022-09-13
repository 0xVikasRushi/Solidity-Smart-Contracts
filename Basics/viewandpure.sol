// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract ViewandPure {
    uint256 a = 1;
    uint256 b = 2;
    uint256 e = 5;
    //view to read content
    // pure to only for local var return

    function variableA() public view returns (uint256) {
        return a;
    }

    function variableB() public view returns (uint256) {
        return b + 1;
    }

    function variableC() public pure returns (uint256) {
        uint256 c = 3;
        return c;
    }

    function variableD() public pure returns (uint256) {
        uint256 d = 4;
        return d + 1;
    }

    function variableE() public returns (uint256) {
        e +=1;
        return e;
    }
}