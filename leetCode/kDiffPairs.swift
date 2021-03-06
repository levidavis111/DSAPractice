/*
532. K-diff Pairs in an Array

Given an array of integers nums and an integer k, return the number of unique k-diff pairs in the array.

A k-diff pair is an integer pair (nums[i], nums[j]), where the following are true:

0 <= i, j < nums.length
i != j
a <= b
b - a == k
 

Example 1:

Input: nums = [3,1,4,1,5], k = 2
Output: 2
Explanation: There are two 2-diff pairs in the array, (1, 3) and (3, 5).
Although we have two 1s in the input, we should only return the number of unique pairs.
Example 2:

Input: nums = [1,2,3,4,5], k = 1
Output: 4
Explanation: There are four 1-diff pairs in the array, (1, 2), (2, 3), (3, 4) and (4, 5).
Example 3:

Input: nums = [1,3,1,5,4], k = 0
Output: 1
Explanation: There is one 0-diff pair in the array, (1, 1).
Example 4:

Input: nums = [1,2,4,4,3,3,0,9,2,3], k = 3
Output: 2
Example 5:

Input: nums = [-1,-2,-3], k = 1
Output: 2
 

Constraints:

1 <= nums.length <= 104
-107 <= nums[i] <= 107
0 <= k <= 107
*/
class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 0 && k >= 0 else {return 0}
        let numSet = Set(nums)
        var pairMap = [Int:Int]()
        var output = 0
        
        if k == 0 {
            for num in nums {
                if let value = pairMap[num] {
                    pairMap[num] = value + 1
                } else {
                    pairMap[num] = 1
                }
            }
            
            for (_, value) in pairMap {
                if value > 1 {
                    output += 1
                }
            }
        } else {
            for num in numSet {
                let complement = num - k
                if numSet.contains(complement) {
                    output += 1
                }
            }
        }
        return output
    }
}
//Slightly faster:
class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        guard arr.count > 1 else {return true}
        
        var hash = [Int: Int]()//[integer: frequency]
        // var seen = Set<Int>()
        
        for num in arr {
            if let value = hash[num] {
                hash[num] = value + 1
            } else {
                hash[num] = 1
            }
        }        
        
        return Set(hash.values).count == hash.count
    }
}
