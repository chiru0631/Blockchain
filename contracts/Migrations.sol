// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Migrations {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier restricted() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    uint public last_completed_migration;

    function setCompleted(uint completed) public restricted {
        last_completed_migration = completed;
    }
}
