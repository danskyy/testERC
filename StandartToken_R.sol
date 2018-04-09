pragma solidity ^0.4.18;
import "./ERC20_S.sol";
import "./BasicToken.sol";

contract StandartToken_R is ERC20_S, BasicToken_R {
    function transferFrom(address _from, address _to, uint _value) public returns(bool) {
        if ((restricts[_from][msg.sender] >= _value) && (balances[_from] >= _value) && (balances[_to] + _value >= balances[_to])) {
            balances[_from] -= _value;
            balances[_to] += _value;
            Transfer(_from, _to, _value);
            return true;
        }
        
        return false;
    }
    
    function approve(address _spender, uint _amount) public returns(bool) {
        restricts[msg.sender][_spender] = _amount;
        Approval(msg.sender, _spender, _amount);
        return true;
    }
    
    function allowance(address _owner, address _spender) public constant returns(uint) {
        return restricts[_owner][_spender];
    }
}
