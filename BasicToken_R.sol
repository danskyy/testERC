pragma solidity ^0.4.18;
import "./ERC20Basic.sol";

contract BasicToken_R is ERC20Basic_S {
    mapping (address => uint) balances;
    
    function balanceOf(address _whose) public constant returns(uint) {
        return balances[_whose];
    }
    
    function transfer(address _to, uint _value) public returns(bool) {
        if ((balances[msg.sender] >= _value) && (balances[_to] + _value >= balances[_to])) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
            return true;
        }
        
        return false;
    }
}
