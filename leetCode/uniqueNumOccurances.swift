/*
1207. Unique Number of Occurrences

Given an array of integers arr, write a function that returns true if and only if the number of occurrences of each value in the array is unique.

Example 1:

Input: arr = [1,2,2,1,1,3]
Output: true
Explanation: The value 1 has 3 occurrences, 2 has 2 and 3 has 1. No two values have the same number of occurrences.
Example 2:

Input: arr = [1,2]
Output: false
Example 3:

Input: arr = [-3,0,1,-3,1,1,1,-3,10,0]
Output: true
 

Constraints:

1 <= arr.length <= 1000
-1000 <= arr[i] <= 1000
*/
class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        guard arr.count > 1 else {return true}
        
        var hashMap = [Int: Int]() //[number:occurances]
        
        for num in arr {
            if let value = hashMap[num] {
                hashMap[num] = value + 1
            } else {
                hashMap[num] = 1
            }
        }
        
        var seen = Set<Int>()
        
        for (_, value) in hashMap {
            if seen.contains(value) {
                return false
            } else {
                seen.insert(value)
            }
        }
        
        return true
    }
}
