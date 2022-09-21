// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

contract Lottery{
    address payable[] public players;
    address public manager;
    address payable public winner;

    constructor(){
        manager=msg.sender;
    }

    function participate() public payable {
        require(msg.value==3 ether,"Ether is not sufficient");
        players.push(payable (msg.sender));
    }

    function getBalance()public view returns(uint256){
        require(manager==msg.sender,"You are not a manager");
        return address(this).balance;
    }

    function random() public view returns (uint256){
        return uint256(keccak256(abi.encodePacked(block.difficulty,block.timestamp,players.length)));
    }

    function pickWinner() public {
        require(manager==msg.sender);
        require(players.length>=3);
        uint256 r=random();

        uint256 index=r%players.length;
        winner=players[index];
        winner.transfer(getBalance());
        players=new address payable [](0);
    }
}
