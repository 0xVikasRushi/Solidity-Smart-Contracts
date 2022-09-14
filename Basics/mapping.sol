// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract mappingK {
    mapping (uint=>string) public student;
    function input(uint roll, string memory name) public {
        student[roll]=name;
    }

}
