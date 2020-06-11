/*
169. Majority Element

Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

You may assume that the array is non-empty and the majority element always exist in the array.

Example 1:

Input: [3,2,3]
Output: 3
Example 2:

Input: [2,2,1,1,1,2,2]
Output: 2
*/
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {return nums[0]}
        
        let half = nums.count / 2
        var frequency = [Int: Int]()
        
        for num in nums {
            if let value = frequency[num] {
                frequency[num] = value + 1
            } else {
                frequency[num] = 1
            }
        }
        for dict in frequency {
            if dict.value > half {
                return dict.key
            }
        } 
        
        return 0
    }
}
