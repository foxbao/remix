// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract ProxyUUPS is ERC1967Proxy {
    uint256 public data;

    constructor(address _logic, bytes memory _data) ERC1967Proxy(_logic, _data) {}

    receive() external payable { }
}