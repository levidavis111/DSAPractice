/*
204. Count Primes

Count the number of prime numbers less than a non-negative number, n.

Example:

Input: 10
Output: 4
Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
*/
class Solution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 2 else {return 0}
        var isPrime = Array(repeating: true, count: n)
        var count = 0
        
        for i in 2..<n {
            if isPrime[i] {
                count += 1
                var j = 2
                while j * i < n {
                    isPrime[j * i] = false
                    j += 1
                }
            }
        }
        
        return count
    }
}
