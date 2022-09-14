// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract enumKey {
    enum user {allowed,not_allowed,waitmf}
    // user defiend data type : which is assigned to names to intergal values
    user public u1 = user.waitmf;



    enum  House {SMALL,MEDIUM,LARGE}
    House choice;
    function setLarge() public {
        choice = House.LARGE;
    }
    function getChoice() public view returns(House) {
        return choice;
    }

}