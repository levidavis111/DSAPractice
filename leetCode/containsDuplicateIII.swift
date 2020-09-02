/*
220. Contains Duplicate III

Given an array of integers, find out whether there are two distinct indices i and j in the array such that the absolute difference between nums[i] and nums[j] is at most t and the absolute difference between i and j is at most k.

Example 1:

Input: nums = [1,2,3,1], k = 3, t = 0
Output: true
Example 2:

Input: nums = [1,0,1,1], k = 1, t = 2
Output: true
Example 3:

Input: nums = [1,5,9,1,5,9], k = 2, t = 3
Output: false
*/
class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard nums.count > 1 else {return false}
        
        var indices = [Int](0..<nums.count)
        indices = indices.sorted(by: {nums[$0] < nums[$1]})
        
        for i in 0..<indices.count {
            for j in (i + 1)..<indices.count {
                let x = indices[i]
                let y = indices[j]
                
                let numDiff = nums[y] - nums[x]
                let indexDiff = abs(x - y)
                
                if numDiff > t {
                    break
                }
                
                if indexDiff <= k {
                    return true
                }
            }
        }
        return false
    }
}
