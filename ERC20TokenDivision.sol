// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract MyToken is ERC20, ERC20Burnable, Ownable {
    using SafeMath for uint256;

    constructor() ERC20("MyToken", "MTK") {
     //   _mint(msg.sender, 0 * 10 ** decimals());
    }
    
    uint256 public altSupply = 2000000000000000000000000000;

   // Total Supplies of Token
    uint256 public circularSupply = altSupply.div(100).mul(60);
    uint256 public privateSupply  = altSupply.div(100).mul(40);
    
    // Token Distribution
    uint256 public _investorsSupply  = circularSupply.div(100).mul(40);
    uint256 public _rewardsSupply    = circularSupply.div(100).mul(30);
    uint256 public _artistsSupply    = circularSupply.div(100).mul(15);   
    uint256 public _foundersSupply   = circularSupply.div(100).mul(9);
    uint256 public _developersSupply = circularSupply.div(100).mul(6);
    

    /////////////////////////////////////////////////////////////////////////
    // Functions
    /////////////////////////////////////////////////////////////////////////
    
    
    /////////////////////////////////////////////////////////////////////////
    // Mint function
    /////////////////////////////////////////////////////////////////////////
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    
    
    /////////////////////////////////////////////////////////////////////////
    // Private Supply
    /////////////////////////////////////////////////////////////////////////
    function transferprivateSupply(address[] memory recipients, uint256[] memory values) public onlyOwner {
      for (uint256 i = 0; i < recipients.length; i++) {
        values[i] = SafeMath.mul(values[i], 1 ether);
        require(privateSupply > values[i], 'Private Supply is less then the values');
        _mint(recipients[i], values[i]); 
        privateSupply = privateSupply.sub(values[i]);
        altSupply = altSupply.sub(values[i]);
     }
    
    }


    /////////////////////////////////////////////////////////////////////////
    // Transfer Circular Supply
    /////////////////////////////////////////////////////////////////////////  
    function transferCircularSupply(address[] memory recipients, uint256[] memory values) public onlyOwner {
      for (uint256 i = 0; i < recipients.length; i++) {
        values[i] = values[i].mul(1 ether);
        require(circularSupply > values[i], 'Circular Supply is less then the values');
        _mint(recipients[i], values[i]); 
        circularSupply = circularSupply.sub(values[i]);
        altSupply = altSupply.sub(values[i]);
     }
    
    }
    
    
    ////////////////////////////////////////////////////////////////////////
    //  transfer Inverstor supply
    /////////////////////////////////////////////////////////////////////////
    function transferInvestorSupply(address[] memory recipients, uint256[] memory values) public onlyOwner {
      for (uint256 i = 0; i < recipients.length; i++) {
        values[i] = values[i].mul(1 ether);
        require(_investorsSupply > values[i], 'Investors Supply is less then the values');
        _mint(recipients[i], values[i]); 
        _investorsSupply = _investorsSupply.sub(values[i]);
        altSupply = altSupply.sub(values[i]);
     }
    
    }
    
    
    ////////////////////////////////////////////////////////////////////////
    //  transfer Reward supply
    /////////////////////////////////////////////////////////////////////////
    function transferRewardSupply(address[] memory recipients, uint256[] memory values) public onlyOwner {
      for (uint256 i = 0; i < recipients.length; i++) {
        values[i] = values[i].mul(1 ether);
        require(_rewardsSupply > values[i], 'Reward Supply is less then the values');
        _mint(recipients[i], values[i]); 
        _rewardsSupply = _rewardsSupply.sub(values[i]);
        altSupply = altSupply.sub(values[i]);
     }
    
    }
    
    
    /////////////////////////////////////////////////////////////////////////
    // Transfer Artists Supply
    ////////////////////////////////////////////////////////////////////////
    function transferArtistsSupply(address[] memory recipients, uint256[] memory values) public onlyOwner {
      for (uint256 i = 0; i < recipients.length; i++) {
        values[i] = values[i].mul(1 ether);
        require(_artistsSupply > values[i], 'Artists Supply is less then the values');
        _mint(recipients[i], values[i]); 
        _artistsSupply = _artistsSupply.sub(values[i]);
        altSupply = altSupply.sub(values[i]);
     }
    
    }
    
    
    ////////////////////////////////////////////////////////////////////////
    //  transfer Founders supply
    /////////////////////////////////////////////////////////////////////////
    function transferFoundersSupply(address[] memory recipients, uint256[] memory values) public onlyOwner {
      for (uint256 i = 0; i < recipients.length; i++) {
        values[i] = values[i].mul(1 ether);
        require(_foundersSupply > values[i], 'Founders Supply is less then the values');
        _mint(recipients[i], values[i]); 
        _foundersSupply = _foundersSupply.sub(values[i]);
        altSupply = altSupply.sub(values[i]);
     }
    
    }
    
    
    ////////////////////////////////////////////////////////////////////////
    //  transfer Developers supply
    /////////////////////////////////////////////////////////////////////////
    function transferDevelopersSupply(address[] memory recipients, uint256[] memory values) public onlyOwner {
      for (uint256 i = 0; i < recipients.length; i++) {
        values[i] = values[i].mul(1 ether);
        require(_developersSupply > values[i], 'Developers Supply is less then the values');
        _mint(recipients[i], values[i]); 
        _developersSupply = _developersSupply.sub(values[i]);
        altSupply = altSupply.sub(values[i]);
     }
    
    }
}
