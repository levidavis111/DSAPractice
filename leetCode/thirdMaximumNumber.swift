/*
414. Third Maximum Number

Given a non-empty array of integers, return the third maximum number in this array. If it does not exist, return the maximum number. The time complexity must be in O(n).

Example 1:
Input: [3, 2, 1]

Output: 1

Explanation: The third maximum is 1.
Example 2:
Input: [1, 2]

Output: 2

Explanation: The third maximum does not exist, so the maximum (2) is returned instead.
Example 3:
Input: [2, 2, 3, 1]

Output: 1

Explanation: Note that the third maximum here means the third maximum distinct number.
Both numbers with value 2 are both considered as second maximum.
*/
class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {return max(nums[0], nums[1])}
        
        var max = Int.min
        var second = Int.min
        var third = Int.min
        
        for num in nums where num != max && num != second && num != third {
            if num > max {
                third = second
                second = max
                max = num
            } else if num > second {
                third = second
                second = num
            } else if num > third {
                third = num
            }
        }
        return third > Int.min ? third : max
    }
}
