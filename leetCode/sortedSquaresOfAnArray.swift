/*
977. Squares of a Sorted Array

Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

Example 1:

Input: nums = [-4,-1,0,3,10]
Output: [0,1,9,16,100]
Explanation: After squaring, the array becomes [16,1,0,9,100].
After sorting, it becomes [0,1,9,16,100].
Example 2:

Input: nums = [-7,-3,2,3,11]
Output: [4,9,9,49,121]
 

Constraints:

1 <= nums.length <= 104
-104 <= nums[i] <= 104
nums is sorted in non-decreasing order.
*/
//Binary search solution:
class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var output = [Int]()
        
        for num in nums {
            insertSorted(num, &output)
        }
        return output
    }
    func insertSorted(_ num: Int, _ arr: inout[Int]) {
        let squared = num * num
        guard arr.count > 0 else {arr.append(squared); return}
        
        var left = 0
        var right = arr.count - 1
        
        while left <= right {
            let middle = (left + right) / 2
            let current = arr[middle]
            
            if current == squared {
                arr.insert(squared, at: middle)
                return
            } else if current < squared {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        arr.insert(squared, at: left)
    }
}
//Higher-order method solution:
class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        let squared = nums.map {$0 * $0}
        let sorted = squared.sorted(by: {$0 < $1})
        
        return sorted
    }
}
