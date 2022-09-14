//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

abstract contract Calculator {
    function sum(uint256 a, uint256 b) public view virtual returns (uint256);
}

contract Test is Calculator {
    function sum(uint256 a, uint256 b) public pure override returns (uint256) {
        return a + b;
    }
}
