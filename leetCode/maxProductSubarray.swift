/*
152. Maximum Product Subarray

Given an integer array nums, find the contiguous subarray within an array (containing at least one number) which has the largest product.

Example 1:

Input: [2,3,-2,4]
Output: 6
Explanation: [2,3] has the largest product 6.
Example 2:

Input: [-2,0,-1]
Output: 0
Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
*/
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {return 0}
        guard nums.count > 1 else {return nums[0]}
        
        var smallest = nums[0]
        var biggest = nums[0]
        var maxProd = nums[0]
        
        for index in 1..<nums.count {
            let current = nums[index]
            let temp = biggest
            biggest = max(current, biggest * current, smallest * current)
            smallest = min(current, temp * current, smallest * current)
            maxProd = max(maxProd, biggest, smallest)
        }
        
        return maxProd
    }
}
