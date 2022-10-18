// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;
contract LotterySmartContract{

    address payable  public owner;
    address payable[] public players;
    uint public lotteryId;
    mapping (uint=>address payable) public lotteryWinnerList;


    constructor(){
        owner = payable(msg.sender);
        lotteryId=0;
    }



    modifier onlyOwner(){
        require(owner==msg.sender,"you can't pick winner only owner does");
        _;
    }


    function EnterLottery() payable public{
        require(msg.value > .01 ether,"insufficent Balance");
        players.push(payable(msg.sender));

    }

    function pickWinner() public onlyOwner{
        uint i = getrandomnumber() % players.length ;
        address payable winneraddress = players[i];
        winneraddress.transfer(address(this).balance);
        lotteryId++;
        lotteryWinnerList[lotteryId] = winneraddress;
        // once after the winner picked reset again

        players  = new address payable[](0); // new array for players
    }

    function getrandomnumber() public view returns(uint){
        // problem with generating this is this getrandomnumber is predictable
        // uses hashing to generate number this does the job but can't be further
        return uint(keccak256(abi.encodePacked(owner,block.timestamp)));
    }


    function getPlayers() public view returns(address payable[] memory){
        return players;
    }


    function getPotBalance() public view returns(uint){
        return address(this).balance;
    }





}





