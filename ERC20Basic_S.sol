pragma solidity ^0.4.18;
contract ERC20Basic_S {
    uint public totalSupply = 0;
    function balanceOf(address _owner) public constant returns(uint);
    function transfer(address _to, uint _value) public returns(bool);
    event Transfer(address indexed _from, address indexed _to, uint _value);
}
