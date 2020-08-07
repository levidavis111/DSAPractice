/*
645. Set Mismatch

The set S originally contains numbers from 1 to n. But unfortunately, due to the data error, one of the numbers in the set got duplicated to another number in the set, which results in repetition of one number and loss of another number.

Given an array nums representing the data status of this set after the error. Your task is to firstly find the number occurs twice and then find the number that is missing. Return them in the form of an array.

Example 1:
Input: nums = [1,2,2,4]
Output: [2,3]
Note:
The given array size will in the range [2, 10000].
The given array's numbers won't have any order.
*/
lass Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var hash = [Int:Int]()
        var output = [Int]()
        
        for num in nums {
            if let value = hash[num] {
                hash[num] = value + 1
            } else {
                hash[num] = 1
            }
        }
        
        for num in 1...nums.count {
            if let value = hash[num] {
                if value > 1 {
                    output.insert(num, at: 0)
                }
            } else {
                output.append(num)
            }
        }
        
        return output
    }
}
//Using Set
class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var seen = Set<Int>()
        var numsSet = Set(nums)
        var dupe = 0
        var missing = 0
        
        for num in nums {
            if seen.contains(num) {
                dupe = num
                break
            } else {
                seen.insert(num)
            }
        }
        
        for num in 1...nums.count {
            if !numsSet.contains(num) {
                missing = num
                break
            }
        }
        
        
        return [dupe, missing]
    }
}
