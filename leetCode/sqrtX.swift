/*
69. Sqrt(x)

Implement int sqrt(int x).

Compute and return the square root of x, where x is guaranteed to be a non-negative integer.

Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.

Example 1:

Input: 4
Output: 2
Example 2:

Input: 8
Output: 2
Explanation: The square root of 8 is 2.82842..., and since 
             the decimal part is truncated, 2 is returned.
*/
//Naive:
class Solution {
    func mySqrt(_ x: Int) -> Int {
        guard x > 1 else {return x}
        
        for num in 2...x {
            if num * num == x {
                return num
            } else {
                if num * num > x {
                    return num - 1
                }
            }
        }
        return 0
    }
}

//Faster (binary search) solution:
class Solution {
    func mySqrt(_ x: Int) -> Int {
        guard x > 1 else {return x}
        
        var left = 1
        var right = x
        
        while left <= right {
            let num = (left + right) / 2
            
            if num * num == x {
                return num
            } else if num * num > x {
                right = num - 1
            } else {
                left = num + 1
            }
        }
        return right
    }
}
