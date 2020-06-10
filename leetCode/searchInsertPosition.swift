/*
Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You may assume no duplicates in the array.
*/
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {return 0}
        
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let middle = (left + right) / 2
            let num = nums[middle]
            
            if num == target {
                return middle
            } else if num > target {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        return left
    }
}
