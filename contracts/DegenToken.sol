// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    mapping(uint8 => uint256) items;
    address private shop;
    
    constructor(address InitialOwner) ERC20("Degen", "DGN") Ownable(InitialOwner) {
        //Leather Helm
        items[0] = 200;
        //Sword
        items[1] = 500;
        //Shield
        items[2] = 250;
        //Dagger
        items[3] = 100;
        //Recall Spell
        items[4] = 300;
        shop = 0xAa8331Df683aa25A1678A436E7BB67A953e5Ab9C;
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }
    
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    
    function transferTokens(address to, uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Not Enough Degen Tokens");
        approve(msg.sender, amount);
        transferFrom(msg.sender, to, amount);
    }

    function burn(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Not Enough Degen Tokens");
        _burn(msg.sender, amount);
    }

    function checkBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function showItems() external pure returns (string memory) {
        return "[1] Leather Helm (200 DGN) | [2] Sword (500 DGN) | [3] Shield (250 DGN) | [4] Dagger (100 DGN) | [5] Recall Spell (300 DGN)";
    }

    function redeemTokens(uint8 option) external payable {
        require(option <= 5 && option != 0, "Invalid Option");
        uint8 itemIndex = option - 1;
    
        uint256 cost = items[itemIndex];
        transferTokens(shop, cost);
    }
}
