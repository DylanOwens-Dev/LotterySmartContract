//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Lottery {

    //declaring the players and manager var
    address payable[] public players;
    address public manager;

    constructor() {
        manager = msg.sender;
    }

    //making the receive to allow players to join
    receive () payable external {
        //require .1 ETH
        require(msg.value == 100000000000000000);
        //adding player to players array
        players.push(payable(msg.sender));
    }

    //modifier to require manager
    modifier onlyManager() {
        require(msg.sender == manager);
        _;
    }

    //returning the contracts balance
    function getBalance() public view onlyManager returns(uint) {
        return address(this).balance;
    }


}