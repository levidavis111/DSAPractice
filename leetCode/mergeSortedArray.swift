/*
88. Merge Sorted Array

Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

The number of elements initialized in nums1 and nums2 are m and n respectively. You may assume that nums1 has enough space (size that is equal to m + n) to hold additional elements from nums2.

Example 1:

Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
Output: [1,2,2,3,5,6]
Example 2:

Input: nums1 = [1], m = 1, nums2 = [], n = 0
Output: [1]
 

Constraints:

0 <= n, m <= 200
1 <= n + m <= 200
nums1.length == m + n
nums2.length == n
-109 <= nums1[i], nums2[i] <= 109
*/
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard m + n > 0 else {return}
        let totalLen = m + n
        var output = Array(repeating: 0, count: totalLen)
        let maxOne = m
        let maxTwo = n
        var index = 0
        var indexOne = 0
        var indexTwo = 0
        
        while index < totalLen {
            var isOneExhausted = indexOne >= maxOne
            var isTwoExhausted = indexTwo >= maxTwo
            if !isOneExhausted && (isTwoExhausted || nums1[indexOne] < nums2[indexTwo]) {
                output[index] = nums1[indexOne]
                indexOne += 1
            } else {
                output[index] = nums2[indexTwo]
                indexTwo += 1
            }
            index += 1
        }
        nums1 = output
    }
}
