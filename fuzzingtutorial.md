# SMART CONTRACT TESTING: FOUNDRY FUZZ TESTING

#### Introduction  
#### Fuzzing and Foundry
#### Test example  
#### conclusion  
#### references  


### INTRODUCTION 
As a smart contract developer, you know ho important it is to come up with various scenarios to test the contract. While this allows us find vulnerabilities and ensure the security of the code, we cannot always find tall the bugs in the contract or totally confirm its functionality with uit testing. However, those impossiblities can be explored with `Property-based testing`.  
Property-based testing is a way of testing general behaviours as opposed to isolated scenarios. Bsically, it involves testing that the software functions as expected. There are two ways to run Property-based test; parametric testing and fuzzing.
In this tutorial, you will learn to run fuzz tests on a smart contract with Foundry.

### FUZZING AND FOUNDRY 
Fuzz testing  is a method of testing that involves providing the software with a tonne of input data (fuzz) in order to find vulnerabilities. triggered by unexpected input. 
Foundry offers built-in features for fuzz testing smart contracts. It leverages the `Forge` framework to generate random data inputs based on the expected data types stated in the contract. Specifically tailored for smart contract vulnerabilities, it focuses on areas like reentrancy attacks, access control issues, and integer overflows.

### FUZZ TEST EXAMPLE 
With a simple arithmetic calculator smart contract, you will learn to run a fuzz test with Foundry.

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

#### Unit Test 
```solidity
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/simpleArithmetic.sol";

contract arithmeticTest is Test {
    simpleArithmetic arithmetic;

    function setUp() public {
        arithmetic = new simpleArithmetic();
    }

    function testAdd () public {
        arithmetic.addNum (4, 0);
    }

    function testSub () public {
        arithmetic.subNum (7, 3);
    }

    function testMul () public {
        arithmetic.mulNum(11, 4);
    }

    function testDiv () public {
        arithmetic.divNum(22, 11);
    }
}
``` 
On running `forge test`, the tests passed:
```bash
macbookair@Vicentia-Peace FoundryFuzzing % forge test
[⠊] Compiling...
[⠔] Compiling 2 files with 0.8.17
[⠑] Solc 0.8.17 finished in 3.48s
Compiler run successful

Running 4 tests for test/arithmetic.t.sol:arithmeticTest
[PASS] testAdd() (gas: 27697)
[PASS] testDiv() (gas: 27888)
[PASS] testMul() (gas: 27754)
[PASS] testSub() (gas: 27929)
Test result: ok. 4 passed; 0 failed; finished in 981.59µs
```