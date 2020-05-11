pragma solidity ^0.5.0;
contract owned
{
    address owner;
    constructor()public{
        owner = msg.sender;
    }
     modifier onlyowner
     {
         require(msg.sender==owner,"You are not allowed");
         _;
     }
}