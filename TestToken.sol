pragma solidity ^0.4.18;
import "./Ownable.sol";

contract BoltCoin is Ownable {
    string public constant name = "BoltCoin";
    string public constant symbol = "BLT";
    uint8 public constant decimals = 18;
    uint public totalSupply = 0;
    mapping (address => uint) balances;
    mapping (address => mapping(address => uint)) restricts;
    
    function balanceOf(address _owner) public constant returns(uint) {
        return balances[_owner];
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
    
    function mint(address _to, uint _amount) public onlyOwner {
        assert((totalSupply + _amount >= totalSupply) && (balances[_to] + _amount >= balances[_to]));
        balances[_to] += _amount;
        totalSupply += _amount;
    }
    
    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _amount);
}
