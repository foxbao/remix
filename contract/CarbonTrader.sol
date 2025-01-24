// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

error CarbonTrader_NotOwner();
contract CarbonTrader{
    mapping(address=>uint256) private s_addressToAllowances;
    mapping(address=>uint256) private s_frozenAllowances;
    address private immutable i_owner;
    constructor(){
        i_owner=msg.sender;
    }
    modifier onlyOwner(){
        if (msg.sender!=i_owner){
            revert CarbonTrader_NotOwner();
        }
        _;
    }
    function issueAllowance(address user,uint256 amount)  public onlyOwner{
        s_addressToAllowances[user]+=amount;
    }

    function getAllowance(address user) public view returns (uint256){
        return s_addressToAllowances[user];
    }

    function freezeAllowance(address user,uint256 freezeAmount) public onlyOwner{
        s_addressToAllowances[user]-=freezeAmount;
        s_frozenAllowances[user]+=freezeAmount;
    }

    function unfreezeAllowance(address user,uint256 freezeAmount) public onlyOwner{
        s_addressToAllowances[user]+=freezeAmount;
        s_frozenAllowances[user]-=freezeAmount;
    }

    function getFrozenAllowance(address user) public view returns(uint256){
        return s_frozenAllowances[user];
    }

    function destroyAllowwance (address user, uint256 destroyAmount)public onlyOwner{

    }


}