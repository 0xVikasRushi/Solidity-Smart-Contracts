// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract CrowdFunding {
    address public manager;
    uint256 public target;
    uint256 public deadline;
    uint256 public MinContribution;
    address payable victim;
    uint256 public raisedAmount;
    uint256 public NoOfContributors;

    mapping(address => uint256) MoneyPool;

    constructor(
        uint256 _target,
        uint256 _deadline,
        uint256 _MinContribution
    ) {
        manager = msg.sender;
        deadline = _deadline;
        target = _target;
        MinContribution = _MinContribution; // uints are ethereum
    }

    modifier onlyManager() {
        require(
            manager == msg.sender,
            "You dont have access to manager account"
        );
        _;
    }

    function setVictim(address _victim) public onlyManager {
        victim = payable(_victim);
    }

    function Contribution() public payable {
        uint256 AmountRaised = msg.value;
        require(
            AmountRaised > 0 && AmountRaised > MinContribution,
            "Your contribution is less than MinContribution"
        );
        require(
            block.timestamp < deadline,
            "Deadline is completed you can't contribute further"
        );
        if (MoneyPool[msg.sender] == 0) {
            NoOfContributors++;
        }
        MoneyPool[msg.sender] += AmountRaised;
        raisedAmount += AmountRaised;
    }

    function transferMoney() public payable onlyManager {
        require(target <= raisedAmount, "You didn't raised amount");
        require(
            deadline < block.timestamp,
            "You can't transfer funds before deadline"
        );
        victim.transfer(address(this).balance);
    }

    function refund() public payable {
        require(block.timestamp > deadline, "You did't crossed deadline ");
        // require (raisedAmount>target,"you didn't raised suffient money ");
        require(MoneyPool[msg.sender] > 0, "YOU ARE NOT contributed");
        address payable user = payable(msg.sender);
        user.transfer(MoneyPool[msg.sender]);
    }

    function checkAmountofEachContributor(address person)
        public
        view
        returns (uint256)
    {
        return MoneyPool[person];
    }

    function BalanceOfMoneyContributed() public view returns (uint256) {
        return address(this).balance;
    }
}
