// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract FashionChainToken is ERC20, Ownable {
    using SafeMath for uint256;

    constructor() ERC20("FashionChain", "FC") {
        _mint(msg.sender, 10000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transfer(
        address to,
        uint256 amount
    ) public override onlyOwner returns (bool) {
        // Round up to the nearest multiple of 10
        if (amount % 10 != 0) {
            amount = amount.add(10 - (amount % 10));
        }

        // Calculate 40% of the rounded amount to transfer
        uint256 transferAmount = amount.mul(40).div(100);

        return super.transfer(to, transferAmount);
    }
}
