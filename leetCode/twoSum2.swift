/*
167. Two Sum II - Input array is sorted

Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.

The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.

Note:

Your returned answers (both index1 and index2) are not zero-based.
You may assume that each input would have exactly one solution and you may not use the same element twice.
Example:

Input: numbers = [2,7,11,15], target = 9
Output: [1,2]
Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
*/
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard numbers.count > 1 else {return [Int]()}
        
        var left = 0
        var right = numbers.count - 1
        
        for index in 0..<numbers.count {
            let number = numbers[index]
            left = index + 1
            right = numbers.count - 1
            
            while left <= right {
                let middle = (left + right) / 2
                let secondNum = numbers[middle]
                let complement = target - number
                
                if secondNum == complement {
                    return [index + 1, middle + 1]
                } else if secondNum > complement {
                    right = middle - 1
                } else {
                    left = middle + 1
                }
            }
        }
        
        return [Int]()
    }
}
//Two-pointer approach
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard numbers.count > 1 else {return []}
        
        var leftPointer = 0
        var rightPointer = numbers.count - 1
        
        while leftPointer <= rightPointer {
            let sum = numbers[leftPointer] + numbers[rightPointer]
            if sum == target {
                return [leftPointer + 1, rightPointer + 1]
            } else if sum < target {
                leftPointer += 1
            } else {
                rightPointer -= 1
            }
        }
        
        
        return []
    }
}
