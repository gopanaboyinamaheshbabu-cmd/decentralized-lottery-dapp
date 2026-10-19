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
/*
  Errors
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
    // @dev The duration of the lottery in seconds
    uint256 private immutable i_interval;
    address payable[] private s_players;
    uint256 private s_lastTimeStamp;
    /* Events */
    event RafflEntered(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() external payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughEthSent();
        }
        s_players.push(payable(msg.sender));
        emit RafflEntered(msg.sender);
    }

    // 1.Get a random number
    // 2.use random number to pick winner
    // 3. Be automatically called
    function pickWinner() external {
        // check to see if enough time has passed
        if (block.timestamp - s_lastTimeStamp < i_interval) {
            revert();
        }
    }

    /* Getter function */
    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
