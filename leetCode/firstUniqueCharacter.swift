/*
387. First Unique Character in a String

Given a string, find the first non-repeating character in it and return its index. If it doesn't exist, return -1.

Examples:

s = "leetcode"
return 0.

s = "loveleetcode"
return 2.
 

Note: You may assume the string contains only lowercase English letters.
*/
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        let s = Array(s)
        guard s.count > 0 else {return -1}
        var hash = [Character:Int]()
        
        for char in s {
            if let value = hash[char] {
                hash[char] = value + 1
            } else {
                hash[char] = 1
            }
            
        }
        for index in 0..<s.count {
            if hash[s[index]] == 1 {
                return index
            }
        }
        return -1
    }
}
