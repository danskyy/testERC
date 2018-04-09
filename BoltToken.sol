pragma solidity ^0.4.18;
import "./MintableToken_R.sol";

contract BoltToken is MintableToken_R {
    string public constant name = "BoltCoin";
    string public constant symbol = "BLT";
    uint8 public constant decimals = 18;
}
