pragma solidity ^0.4.18;

import './BaseToken.sol';

contract UCoin is BaseToken {
  // Publicly listed name
  string public name = "U COIN";
  // Symbol under which token will be trading
  string public symbol = "U";
  // 1 ETH consists of 10^18 Wei, which is the smallest ETH unit
  uint8 public decimals = 18;
  // Defining the value of a million for easy calculations - order of declaration matters (hoisting)
  uint256 million = 1000000 * (uint256(10) ** decimals);
  // We are offering a total of 100 Million Ulcoin Tokens to distribute
  uint256 public totalSupply = 40000 * million;
  // Address where all the tokens are held, as tokens aren't held within the Smart Contract
  address public masterWallet;

  // constructor function
  function UCoin()
    public
  {
    // The wallet from which the contract is deployed, also the owner of the contract
    owner = msg.sender;
    masterWallet = owner;


    // Assign total supply to master wallet
    // https://github.com/OpenZeppelin/zeppelin-solidity/issues/494
    // A token contract which creates new tokens SHOULD trigger a Transfer event with the _from address set to 0x0 when tokens are created.
    balances[masterWallet] = totalSupply;
    emit Transfer(0x0, masterWallet, totalSupply);
  }

  function burn(uint256 _value) onlyOwner public {
    require(_value <= balances[msg.sender]);
    // no need to require value <= totalSupply, since that would imply the
    // sender's balance is greater than the totalSupply, which *should* be an assertion failure

    address burner = msg.sender;
    balances[burner] = balances[burner].sub(_value);
    totalSupply_ = totalSupply_.sub(_value);
    emit Burn(burner, _value);
    emit Transfer(burner, address(0), _value);
  }

  // Events
  event Burn(address indexed burner, uint256 value);
}
