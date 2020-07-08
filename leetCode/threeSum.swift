/*
15. 3Sum

Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

Note:

The solution set must not contain duplicate triplets.

Example:

Given array nums = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
  [-1, 0, 1],
  [-1, -1, 2]
]
*/
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else {return [[Int]]()}
        let nums = nums.sorted()
        var output: Set<[Int]> = []
        
        for index in 0..<nums.count - 2 {
            if index == 0 || index > 0 && nums[index] != nums[index - 1] {
                var left = index + 1
                var right = nums.count - 1
                let target = -nums[index]
                while left < right {
                    if nums[left] + nums[right] == target {
                        output.insert([nums[index], nums[left], nums[right]])
                        while left < right && nums[left] == nums[left + 1] {
                            left += 1
                        }
                        while left < right && nums[right] == nums[right - 1] {
                            right -= 1
                        }
                        left += 1
                        right -= 1
                    } else if nums[left] + nums[right] > target {
                        right -= 1
                    } else {
                        left += 1
                    }
                }
            }
        }
        
        return Array(output)
    }
    
}
