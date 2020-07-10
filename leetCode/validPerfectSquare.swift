/*
367. Valid Perfect Square

Given a positive integer num, write a function which returns True if num is a perfect square else False.

Follow up: Do not use any built-in library function such as sqrt.

 

Example 1:

Input: num = 16
Output: true
Example 2:

Input: num = 14
Output: false
 

Constraints:

1 <= num <= 2^31 - 1
*/
class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        guard num != 1 else {return true}
        var left = 1
        var right = num / 2
        
        while left <= right {
            let middle = (left + right) / 2
            let sqr = middle * middle
            
            if sqr == num {
                return true
            } else if sqr < num {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        
        return false
    }
}
