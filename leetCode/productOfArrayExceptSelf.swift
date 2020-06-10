/*
238. Product of Array Except Self

Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

Example:

Input:  [1,2,3,4]
Output: [24,12,8,6]
Constraint: It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.

Note: Please solve it without division and in O(n).

Follow up:
Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)
*/
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {return [Int]()}
        var productSoFar = 1
        var output = Array(repeating: 0, count: nums.count)
        
        for index in 0..<nums.count {
            let num = nums[index]
            output[index] = productSoFar
            productSoFar *= num
        }
        
        productSoFar = 1
        
        for index in (0..<nums.count).reversed() {
            let num = nums[index]
            output[index] *= productSoFar
            productSoFar *= num
        }
        
        return output
    }
}
