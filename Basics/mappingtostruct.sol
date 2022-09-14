// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract mappingS {
    struct student{
        string name;
        uint age;
        string class;
    }
    mapping (uint=>student) public data;
    function getData(uint roll,string memory _name,uint _age,string memory _class) public {
        data[roll] = student(_name,_age,_class);
    }

}