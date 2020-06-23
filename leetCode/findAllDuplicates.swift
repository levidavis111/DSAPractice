/*
42. Find All Duplicates in an Array

Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.

Find all the elements that appear twice in this array.

Could you do it without extra space and in O(n) runtime?

Example:
Input:
[4,3,2,7,8,2,3,1]

Output:
[2,3]
*/
class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        var output = [Int]()
        
        for i in 0..<nums.count {
            let index = abs(nums[i]) - 1
            
            if nums[index] < 0 {
                output.append(abs(nums[i]))
            }
            nums[index] *= -1
        }
        
        return output
    }
}
//Simpler, but uses extra memory:

class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var seen = Set<Int>()
        var output = [Int]()
        
        for num in nums {
            if seen.contains(num) {
                output.append(num)
            } else {
                seen.insert(num)
            }
        }
        
        return output
    }
}
