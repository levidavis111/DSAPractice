/*
350. Intersection of Two Arrays II

Given two arrays, write a function to compute their intersection.

Example 1:

Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2,2]
Example 2:

Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [4,9]
*/
//Hashmap:
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        guard nums1.count > 0, nums2.count > 0 else {return []}
        
        var hash = [Int:Int]()
        var output = [Int]()
        
        for num in nums1 {
            if let value = hash[num] {
                hash[num] = value + 1
            } else {
                hash[num] = 1
            }
        }
        
        for num in nums2 {
            if let value = hash[num] {
                hash[num] = value - 1
                if value - 1 >= 0 {
                    output.append(num)
                }
            }
        }
        
        
        return output
    }
}
