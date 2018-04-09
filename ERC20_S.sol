pragma solidity ^0.4.18;
import "./ERC20Basic.sol";

contract ERC20_S is ERC20Basic_S {
    mapping (address => mapping(address => uint)) restricts;
    
    function transferFrom(address _from, address _to, uint _value) public returns(bool);
    function approve(address _spender, uint _amount) public returns(bool);
    function allowance(address _owner, address _spender) public constant returns(uint);
    
    event Approval(address indexed _owner, address indexed _spender, uint _amount);
}
