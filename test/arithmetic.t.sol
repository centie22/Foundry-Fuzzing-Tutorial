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

    function testFuzz_Add (uint128 a,uint128 b) public {
        arithmetic.addNum(a, b);
    }

    function testFuzz_Sub (uint a, uint b) public {
        arithmetic.subNum(a, b);
    }

    function testFuzz_Mul (uint128 a, uint128 b) public{
        arithmetic.mulNum(a, b);
    }

    function testFuzz_Div (uint a, uint b) public{
        arithmetic.divNum(a, b);
    }
}
