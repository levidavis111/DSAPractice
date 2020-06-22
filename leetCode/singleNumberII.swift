/*
137. Single Number II

Given a non-empty array of integers, every element appears three times except for one, which appears exactly once. Find that single one.

Note:

Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

Example 1:

Input: [2,2,3,2]
Output: 3
Example 2:

Input: [0,1,0,1,0,1,99]
Output: 99
*/
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var seen = Set<Int>()
        var seenTwice = Set<Int>()
        
        for num in nums {
            if seen.contains(num) {
                seenTwice.insert(num)
                seen.remove(num)
            } else {
                if !seenTwice.contains(num) {
                    seen.insert(num)
                }
            }
        }
        return Array(seen)[0]
    }
}
