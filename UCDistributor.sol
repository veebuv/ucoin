
pragma solidity ^0.4.18;

import './Ownable.sol';
import './UCoin.sol';
// contract interfaceUNV {
//     function totalSupply() public constant returns (uint);
//     function balanceOf(address tokenOwner) public constant returns (uint balance);
//     function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
//     function transfer(address to, uint tokens) public returns (bool success);
//     function approve(address spender, uint tokens) public returns (bool success);
//     function transferFrom(address from, address to, uint tokens) public returns (bool success);
    
//     function increaseApproval(address _spender, uint _addedValue) public returns (bool);
//     function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool);
//     function burn(uint256 _value) public;

//     event Transfer(address indexed from, address indexed to, uint tokens);
//     event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
//     event Burn(address indexed burner, uint256 value);
//     event Logger(address sender);
// }

contract UCDistributor is Ownable {
    
    UCoin dc;
    
    function UCDistributor(address _t) public {
        dc = UCoin(_t);
    }
    
    function totalSupply ()
    onlyOwner
    public view returns (uint256){
        uint256 sup = dc.totalSupply();
        emit Logger("UCD", sup);
        return sup;
    }
    
    function transfer ( address tokenAddress, address addy, uint256 total)
    public {
        dc.transfer(addy, total);
    }
    
    function balanceOf (address addy)
    onlyOwner
    public view returns (uint256){
        uint256 balance = dc.balanceOf(addy);
        emit Logger("Balance", balance);
        return balance;
    }
    
    event Logger(string someText, uint256 amount);
    event LoggerAdd(string someText, address addy);

}