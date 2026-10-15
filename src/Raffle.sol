// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

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

    function enterRaffle() public payable {}

    function pickWinner() public {}
}
