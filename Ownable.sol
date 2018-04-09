pragma solidity ^0.4.18;
contract Ownable {
    address owner;
    
    function Ownable() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    function transferOwnership(address _newOwner) onlyOwner public returns(bool) {
        owner = _newOwner;
    }
}
