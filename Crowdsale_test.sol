pragma solidity ^0.4.18;
import "./BoltToken.sol";
import "./SafeMath.sol";

contract Crowdsale_test is Ownable {
    using SafeMath for uint;
    address owner;
    address holder;
    address ours;
    BoltToken public token = new BoltToken();
    uint startDate = 1522573200;
    uint period = 28;
    uint hardcap;
    uint rate_;
    uint oursPercent;
    
    modifier inSale {
        require(now > startDate && now < startDate + period * 1 days);
        _;
    }
    
    modifier notReached {
        require(holder.balance < hardcap);
        _;
    }
    
    function Crowdsale_test() public {
        owner = msg.sender;
        rate_ = 1 ether;
        hardcap = 100 * 1 ether;
        oursPercent = 15;
        holder = 0xdd870fa1b7c4700f2bd7f44238821c26f7392148;
        ours = 0x583031d1113ad414f02576bd6afabfb302140225;
    }
    
    function () public payable {
       createTokens();
    }
    
    function createTokens() public inSale notReached payable {
        holder.transfer(msg.value);
        uint tokenCount = rate_.mul(msg.value).div(1 ether);
        token.mint(msg.sender, tokenCount);
    }
    
    function finishMinting() public onlyOwner {
        uint saledTokensCount = token.totalSupply();
        uint ourTokens = saledTokensCount.mul(oursPercent).div(100 - oursPercent);
        token.mint(ours, ourTokens);
        token.finishMinting();
    }
}
