/*
Write an algorithm to determine if a number n is "happy".

A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

Return True if n is a happy number, and False if not.

Example: 

Input: 19
Output: true
Explanation: 
1^2 + 9^2 = 82
8^2 + 2^2 = 68
6^2 + 8^2 = 100
1^2 + 0^2 + 0^2 = 1
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

class Solution {
    func isHappy(_ n: Int) -> Bool {
        guard n > 1 else {return true}
        var n = n
        var seen = Set<Int>()
        
        while n != 1 {
            guard !seen.contains(n) else {return false}
            seen.insert(n)
            n = getSquareOfDigits(n)
        }
        return true
    }
    
    private func getSquareOfDigits(_ n: Int) -> Int {
        var sum = 0
        var n = n
        
        while n > 0 {
            sum += (n % 10) * (n % 10)
            n /= 10
        }
        
        return sum
    }
}

