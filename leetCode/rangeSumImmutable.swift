/*
Discuss (463)
303. Range Sum Query - Immutable

Given an integer array nums, find the sum of the elements between indices i and j (i ≤ j), inclusive.

Example:
Given nums = [-2, 0, 3, -5, 2, -1]

sumRange(0, 2) -> 1
sumRange(2, 5) -> -1
sumRange(0, 5) -> -3
Note:
You may assume that the array does not change.
There are many calls to sumRange function.
*/
//Slow:
class NumArray {
    let nums: [Int]
    init(_ nums: [Int]) {
        self.nums = nums 
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        guard i <= j else {return 0}
        guard j < nums.count else {return 0}
        var total = 0
        for index in i...j {
            total += nums[index]
        }
        return total
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(i, j)
 */
 
 //There is a much faster preprocessor solution that I don't completely understand:
 /*
 class NumArray {
    var sum : [Int] = []
    init(_ nums: [Int]) {
        sum = Array(repeating:0,count:nums.count+1)
        for i in 0..<nums.count {
            sum[i + 1] = sum[i] + nums[i]
        }
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        return sum[j+1] - sum[i]
    }
}
 */
