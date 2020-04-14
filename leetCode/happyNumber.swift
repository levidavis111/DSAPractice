/*
Write an algorithm to determine if a number n is "happy".

A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

Return True if n is a happy number, and False if not.

Example: 

Input: 19
Output: true
Explanation: 
12 + 92 = 82
82 + 22 = 68
62 + 82 = 100
12 + 02 + 02 = 1
*/

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var seen = Set<Int>()
        var num = n
        
        while num != 1 {
            var sum = 0
            while num != 0 {
                sum += (num % 10) * (num % 10)
                num /= 10
            }
            if seen.contains(sum) {
                return false
            } else {
                seen.insert(sum)
            }
            
            num = sum
        }
        
        return true
    }
}
