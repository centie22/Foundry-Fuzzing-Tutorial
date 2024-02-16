# SMART CONTRACT TESTING: FOUNDRY FUZZ TESTING

#### Introduction  
#### What is Fuzzing?  
#### Benefit of fuzzing  
#### Test example  
#### conclusion  
#### references  



It is one thing to write a smart contract and it is another to ensure the functionality of the contract. Smart contract development does not stop at writing the smart contract code; it involves wrirting tests to find bugs and vulnerabilities and adjusting the code.


Fuzz testing  is a method of testing that involves providing the contract with a tonne of input data in order to find vulnerabilities. 


```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract simpleArithmetic {
    uint addValue;
    uint subValue;
    uint divValue;
    uint mulvalue;


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
```