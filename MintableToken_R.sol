pragma solidity ^0.4.18;
import "./StandartToken_R.sol";
import "./Ownable.sol";

contract MintableToken_R is StandartToken_R, Ownable {
    function mint(address _to, uint _amount) public onlyOwner {
        assert((totalSupply + _amount >= totalSupply) && (balances[_to] + _amount >= balances[_to]));
        balances[_to] += _amount;
        totalSupply += _amount;
    }
}
