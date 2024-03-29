// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract simpleArithmetic {
    uint public addValue;
    uint public subValue;
    uint public divValue;
    uint public mulvalue;


    function addNum (uint a, uint b) external returns (uint) {
        addValue = a + b;
        return addValue;
    }

    function subNum (uint a, uint b) external returns (uint) {
        if (a >= b) {
            subValue = a - b;
        } else {
            subValue = 0;
        }
        return subValue;
    }

    function divNum (uint a, uint b) external returns (uint){
        if (a > 0 && a > b && b > 0) {
            divValue = a/b;
        } else {
            divValue = 0;
        }
        
        return divValue;
    }

    function mulNum (uint a, uint b) external returns (uint) {
        mulvalue = a * b;
        return mulvalue; 
    }
}
