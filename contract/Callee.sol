// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// 0xd9145CCE52D386f254917e481eB44e9943F39138
contract Callee {
    uint256 public data;

    event DataStored(address indexed sender, uint256 data);

    function storeData(uint256 _data) public {
        data = _data;
        emit DataStored(msg.sender, _data);
    }
}