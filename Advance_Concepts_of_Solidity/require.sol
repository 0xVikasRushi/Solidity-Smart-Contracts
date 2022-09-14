//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Require {
    function checkInput(uint input) pure public returns(string memory){
        require((input>=0 && input<=255)," Not Within Range");
        return "Within Range";
    }
}
