// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract  BankBalanceCheck {
    mapping (address=>uint256) map;
    function updateBalance(uint256 Amount) public  {
        map[msg.sender] = Amount;
    }
    function checkBalance(address user) public view returns(uint256){
        require(user==msg.sender,"You are not the owner of the account");
        // require check for boolean for value if true continue the with code
        return map[user];
    }
}