/*
205. Isomorphic Strings

Given two strings s and t, determine if they are isomorphic.

Two strings are isomorphic if the characters in s can be replaced to get t.

All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.

Example 1:

Input: s = "egg", t = "add"
Output: true
Example 2:

Input: s = "foo", t = "bar"
Output: false
Example 3:

Input: s = "paper", t = "title"
Output: true
*/
class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {return false}
        var dict = [Character:Character]()
        
        for index in s.indices {
            let sChar = s[index]
            let tChar = t[index]
            
            if let value = dict[sChar] {
                if value != tChar {
                    return false
                }
            } else {
                if dict.values.contains(tChar) {
                    return false
                } else {
                    dict[sChar] = tChar
                }
            }
        }
        
        return true
    }
}
