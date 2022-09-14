// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;
struct student{
    string name;
    uint  age;

}
contract structs {
    student public s1;
    constructor(string memory _name , uint _age){
        s1.name = _name;
        s1.age = _age;
    }

}