/*
258. Add Digits

Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.

Example:

Input: 38
Output: 2 
Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2. 
             Since 2 has only one digit, return it.
*/
class Solution {
    func addDigits(_ num: Int) -> Int {
        guard num > 9 else {return num}
        
        var output = num
        
        while output > 9 {
            var temp = 0
            while output > 0 {
                temp += output % 10
                output /= 10
            }
            output = temp
        }
        
        return output
    }
}
