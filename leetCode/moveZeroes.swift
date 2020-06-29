/*
283. Move Zeroes

Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Example:

Input: [0,1,0,3,12]
Output: [1,3,12,0,0]
Note:

You must do this in-place without making a copy of the array.
Minimize the total number of operations.
*/
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var index = 0
        var count = 0
        while index < nums.count - 1 {
            if nums[index] == 0 {
                nums.remove(at: index)
                count += 1
            } else {
                index += 1
            }
        }
        for _ in 0..<count {
            nums.append(0)
        }
    }
}

//Two Pointer, a little confusing:
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0
        var j = 0
        
        while i < nums.count {
            if nums[i] != 0 {
                if i != j {
                    nums.swapAt(i,j)
                }
                j += 1
            }
            i += 1
        }
    }
}
