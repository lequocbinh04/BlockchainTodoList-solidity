// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.0;
pragma experimental ABIEncoderV2;

import "./utils/Ownable.sol";
import "./utils/SafeMath.sol";

contract ToDoList is Ownable {

    using SafeMath for uint256;

    uint256 limitNote;
    mapping(address => string[]) noteStorage;
    mapping(address => uint256) countNoteAddress;

    constructor () public {
        limitNote = 5;
    }

    function saveNote(string memory noteString) public {
        require(countNoteAddress[_msgSender()].add(1) <= limitNote, "ToDoList: Exceeds limit note can save.");
        countNoteAddress[_msgSender()] = countNoteAddress[_msgSender()].add(1);
        noteStorage[_msgSender()].push(noteString);
    }

    function getNote() public view returns( string[] memory ) {
        return noteStorage[_msgSender()];
    }

    function countNote() public view returns(uint256) {
        return countNoteAddress[_msgSender()];
    }

    function test() public view returns(address payable) {
        return _msgSender();
    }

    function changeLimit(uint256 newLimit) public onlyOwner {
        limitNote = newLimit;
    }
    
}