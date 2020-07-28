/*
633. Sum of Square Numbers

Given a non-negative integer c, your task is to decide whether there're two integers a and b such that a2 + b2 = c.

Example 1:

Input: 5
Output: True
Explanation: 1 * 1 + 2 * 2 = 5
 

Example 2:

Input: 3
Output: False
*/
class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        let sqrtC = Int(sqrt(Double(c)))
        
        for index in 0...sqrtC {
            var left = index
            var right = sqrtC
            
            while left <= right {
                let middle = (left + right) / 2
                let sum = (index * index) + (middle * middle)
                if sum == c {
                    return true
                } else if sum > c {
                    right = middle - 1
                } else {
                    left = middle + 1
                }
            }
        }
        return false
    }
}
