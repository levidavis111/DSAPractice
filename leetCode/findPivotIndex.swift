/*
724. Find Pivot Index

Given an array of integers nums, write a method that returns the "pivot" index of this array.

We define the pivot index as the index where the sum of all the numbers to the left of the index is equal to the sum of all the numbers to the right of the index.

If no such index exists, we should return -1. If there are multiple pivot indexes, you should return the left-most pivot index.

Example 1:

Input: nums = [1,7,3,6,5,6]
Output: 3
Explanation:
The sum of the numbers to the left of index 3 (nums[3] = 6) is equal to the sum of numbers to the right of index 3.
Also, 3 is the first index where this occurs.
Example 2:

Input: nums = [1,2,3]
Output: -1
Explanation:
There is no index that satisfies the conditions in the problem statement.
*/
class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        guard nums.count != 1 else {return 0}
        guard nums.count != 0 else {return -1}
        guard nums.count != 2 else {return -1}
        
        var left = nums.reduce(0, +)
        var right = 0
        
        for index in 0..<nums.count {
            let num = nums[index]
            left -= num
            if left == right {
                return index
            }
            right += num
        }
        
        return -1
    }
}

//Had a cutie binary search solution, but couldn't get it to work with negative numbers:
class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        guard nums.count != 1 else {return 0}
        guard nums.count != 0 else {return -1}
        guard nums.count != 2 else {return -1}
        
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let middle = (left + right) / 2
            guard middle > 1 && middle < nums.count - 1 else {return -1}
            let leftSum = Array(nums[0..<middle]).reduce(0, +)
            let rightSum = Array(nums[(middle + 1)..<nums.count]).reduce(0, +)
            
            if leftSum == rightSum {
                return middle
            } else if leftSum < rightSum {
                left = middle + 1
            } else {
               right = middle - 1 
            }
        }
        return -1
    }
}
