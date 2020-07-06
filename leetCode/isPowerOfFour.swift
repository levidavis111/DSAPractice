/*
342. Power of Four

Given an integer (signed 32 bits), write a function to check whether it is a power of 4.

Example 1:

Input: 16
Output: true
Example 2:

Input: 5
Output: false
*/
class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        guard num != 0 else {return false}
        guard num != 1 else {return true}
        
        if num > 1 {
            return num % 4 == 0 && isPowerOfFour(num / 4)
        }
        
        return false
    }
}
