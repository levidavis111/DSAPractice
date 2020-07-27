/*
509. Fibonacci Number

The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,

F(0) = 0,   F(1) = 1
F(N) = F(N - 1) + F(N - 2), for N > 1.
Given N, calculate F(N).

Example 1:

Input: 2
Output: 1
Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
Example 2:

Input: 3
Output: 2
Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.
Example 3:

Input: 4
Output: 3
Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.
*/
class Solution {
    func fib(_ N: Int) -> Int {
        if N == 0 {return 0}
        if N == 1 {return 1}
        if N == 2 {return 1}
        
        return fib(N - 1) + fib(N - 2)
    }
}
// Much faster:
class Solution {
    func fib(_ N: Int) -> Int {
        if N == 0 {return 0}
        if N == 1 {return 1}
        
        var twoPrev = 0
        var prev = 1
        var current = 0
        
        for _ in 1..<N {
            current = twoPrev + prev
            twoPrev = prev
            prev = current
        }
        
        return current
    }
}
