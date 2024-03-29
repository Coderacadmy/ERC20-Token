pragma solidity ^0.7.0;

contract SALToken{

// 1000000000000000000000000

// name
string public name = "Sal Token";
// symbol
string public symbol = "SAL";
// decimal
uint256 public decimal = 18;
// tottal supply
uint256 public totalSupply;



// Transfer events
event Transfer(address sender, address to, uint256 amount);
// Approval event
event Approval(address from, address spender, uint256 _amount);



// balance mapping
mapping (address => uint256) public balanceOf;
// allowance mapping
mapping (address => mapping(address => uint256)) public allowance;



//constructor
constructor(uint256 _totalsupply) public{
    totalSupply = _totalsupply;
    balanceOf[msg.sender] = _totalsupply;
}



//transfer function
function transfer(address _to, uint256 _amount) public returns(bool success){
    // the user that is transfering amount must have sufficient balance
    require(balanceOf[msg.sender] >= _amount, 'Sorry you have insufficient balance');
    //subtract the amount from sender
    balanceOf[msg.sender] -= _amount;
    // add the amount to the receiver account
    balanceOf[_to] += _amount;
    // emit
    emit Transfer(msg.sender, _to, _amount);
    
}


// Approve function
function Approve(address _spender, uint _amount) public{
    // increase allowlance
    allowance[msg.sender][_spender] += _amount;
    // emit
    emit Approval(msg.sender, _spender, _amount);
}


// Transferfrom function
function Transferfrom(address _from, address _to, uint256 _amount) public{
// check the balance of allowance user
require(balanceOf[_from] >= _amount, 'The user from which money has been dedicuted have insufficient balance');
// check the allowance of msg.sender
require(allowance[_from][msg.sender] >= _amount, 'The spender doest have required allowance');
// subtract the amount from user
balanceOf[_from] -= _amount;
// Add the amount to the user
balanceOf[_to] += _amount;
// decrease the allowance
allowance[_from][msg.sender] -= _amount;
// emit Transfer
emit Transfer(_from, _to, _amount);

// emit Approve
emit Approval(_from, msg.sender, _amount);

 }
}
