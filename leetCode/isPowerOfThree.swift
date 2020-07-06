/*
326. Power of Three

Given an integer, write a function to determine if it is a power of three.

Example 1:

Input: 27
Output: true
Example 2:

Input: 0
Output: false
Example 3:

Input: 9
Output: true
*/
class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        guard n != 0 else {return false}
        guard n != 1 else {return true}
        
        if n > 1 {
            return n % 3 == 0 && isPowerOfThree(n / 3)
        }
        
        return false
    }
}
