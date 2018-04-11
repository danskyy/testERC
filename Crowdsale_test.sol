pragma solidity ^0.4.18;
import "./BoltToken.sol";

contract Crowdsale_test {
    address owner;
    BoltToken public token = new BoltToken();
    uint startDate = 1522573200;
    uint period = 28;
    
    function Crowdsale_test() public {
        owner = msg.sender;
    }
    
    function () public payable {
        require(now > startDate && now < startDate + period * 1 days);
        owner.transfer(msg.value);
        token.mint(msg.sender, msg.value);
    }
}
