// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Implementation {
    string public female;
    string public male;

    function setFemaleName(string memory _name) public {
        female = _name;
    }

    function setMaleName(string memory _name) public {
        male = _name;
    }
}

contract Proxy {
    string public male;
    string public female;
    address public implementation; 

    constructor(address _implementation) {
        implementation = _implementation; 
    }

    fallback() external payable {
        (bool success, ) = implementation.delegatecall(msg.data);
        require(success, "Delegatecall failed");
    }

    receive() external payable { }
}