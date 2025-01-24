// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract ImplementationV1 is UUPSUpgradeable, OwnableUpgradeable {
    uint256 public data;

    event DataStored(address indexed sender, uint256 data);

    function initialize() initializer public {
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
    }

    function storeData(uint256 _data) public {
        data = _data;
        emit DataStored(msg.sender, _data);
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}