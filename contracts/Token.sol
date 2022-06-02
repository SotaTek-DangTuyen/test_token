pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "hardhat/console.sol";

contract TokenV1 is Initializable, ERC20Upgradeable, OwnableUpgradeable {
    // ERC20Upgradeable
    function inittialize() external initializer {
        __ERC20_init("TuyenDM", "DMT");
        __Ownable_init();
        _mint(msg.sender, 1000 * 10**18);
        console.log("TokenV1 initialized", msg.sender);
    }

    function mint(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);
    }

    function getOwner() external view returns (address) {
        return owner();
    }
}
