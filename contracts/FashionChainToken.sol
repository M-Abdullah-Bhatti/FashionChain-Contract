// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";


/// role not granted
error NFCertificate__RoleNotGranted();


contract FashionChainToken is ERC20, Ownable {

    // variables:
    uint256 public rewardvariable;

    using SafeMath for uint256;

    // Mappings:
    mapping(address => bool) public isOwnerShip;

    constructor() ERC20("FashionChain", "FC") {
        _mint(msg.sender, 10000000 * 10 ** decimals());
         isOwnerShip[msg.sender] = true;
         rewardvariable = 60;
    }



     // modifier
    modifier onlyAdmin() {
        if (isOwnerShip[msg.sender] != true) {
            revert NFCertificate__RoleNotGranted();
        }
        _;
    }
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transfer(
        address to,
        uint256 amount
    ) public override onlyAdmin returns (bool) {
        // Round up to the nearest multiple of 10
        if (amount % 10 != 0) {
            amount = amount.add(10 - (amount % 10));
        }

        // Calculate 40% of the rounded amount to transfer
        uint256 transferAmount = amount.mul(rewardvariable).div(100);

        return super.transfer(to, transferAmount);
    }

    // grant role to user as admin by admin
    function grantRole(address to) public onlyAdmin {
        isOwnerShip[to] = true;
    }

     // grant role to user as admin by admin
    function setrewardVariable(uint256 _rewardvariable) public onlyAdmin {
        rewardvariable = _rewardvariable;
    }
}
