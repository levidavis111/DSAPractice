/*
747. Largest Number At Least Twice of Others

In a given integer array nums, there is always exactly one largest element.

Find whether the largest element in the array is at least twice as much as every other number in the array.

If it is, return the index of the largest element, otherwise return -1.

Example 1:

Input: nums = [3, 6, 1, 0]
Output: 1
Explanation: 6 is the largest integer, and for every other number in the array x,
6 is more than twice as big as x.  The index of value 6 is 1, so we return 1.
 

Example 2:

Input: nums = [1, 2, 3, 4]
Output: -1
Explanation: 4 isn't at least as big as twice the value of 3, so we return -1.
 

Note:

nums will have a length in the range [1, 50].
Every nums[i] will be an integer in the range [0, 99].
*/
class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {return 0}
        var biggest = Int.min
        var secondBiggest = Int.min
        var biggestIndex = 0
        
        for index in 0..<nums.count {
            let num = nums[index]
            if num > biggest {
                secondBiggest = biggest
                biggest = num
                biggestIndex = index
            } else if num > secondBiggest {
                secondBiggest = num
            }
        }
        
        return biggest >= (2 * secondBiggest) ? biggestIndex : -1
    }
}

//Using sorted, which is Nlog(n) (above in linear):
class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {return 0}
        let sorted = nums.sorted()
        let biggest = sorted[sorted.count - 1]
        let secondBiggest = sorted[sorted.count - 2]
        
        if biggest >= 2 * secondBiggest {
            return nums.index(of: biggest) ?? -1
        } else {
            return -1
        }
    }
}
