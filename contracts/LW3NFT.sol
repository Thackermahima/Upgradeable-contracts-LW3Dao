// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract LW3NFT is Initializable, ERC721Upgradeable, UUPSUpgradeable, OwnableUpgradeable
{
    function initialize() public initializer{
        __ERC721_init("LW3NFT", "LW3NFT");
        __Ownable_init();
        _mint(msg.sender, 1);
    }
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner{}
}
/* 
If you look at all the contracts which LW3NFT is importing, you will realize why they are important. First being the Initializable contract from Openzeppelin which provides us with the initializer modifier which ensures that the initialize function is only called once. The initialize function is needed because we cant have a contructor in the Implementation Contract which in this case is the LW3NFT contract
It imports ERC721Upgradeable and OwnableUpgradeable because the original ERC721 and Ownable contracts have a constructor which cant be used with proxy contracts.
Another interesting function which we dont see in the normal ERC721 contract is the _authorizeUpgrade which is a function which needs to be implemented by the developer 
when they import the UUPSUpgradeable Contract from Openzeppelin, it can be found here. Now why this function has to be overwritten is interesting because it gives us the ability to add authorization on who can actually upgrade the given contract, it can be changed according to requirements but in our case we just added an onlyOwner modifier.
*/