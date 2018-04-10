pragma solidity ^0.4.18;
import "./ERC20Basic.sol";
import "./SafeMath.sol";

contract BasicToken_R is ERC20Basic_S {
    using SafeMath for uint;
    mapping (address => uint) balances;
    
    function balanceOf(address _whose) public constant returns(uint) {
        return balances[_whose];
    }
    
    function transfer(address _to, uint _value) public returns(bool) {
        require(_to != address(0));
        
        if ((balances[msg.sender] >= _value) && (balances[_to] + _value >= balances[_to])) {
            balances[msg.sender] = balances[msg.sender].sub(_value);
            balances[_to] = balances[_to].add(_value);
            Transfer(msg.sender, _to, _value);
            return true;
        }
        
        return false;
    }
}
