// Layout of the contract file:
// version
// imports
// errors
// interfaces, libraries, contract

// Inside Contract:
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
/**
 * Errors
 */
error Raffle__NotEnoughEthSent();

/**
 * @title Sample lottery smart contract
 * @author Mahesh Babu Gopanaboyina
 * @notice This contract makes anyone participate in Lottery program
 * @dev Using chainlink verifiable random function
 */
contract Raffle {
    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughEthSent();
        }
    }

    function pickWinner() public {}

    /**
     * Getter function
     */
    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
