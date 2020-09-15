/*
459. Repeated Substring Pattern

Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only and its length will not exceed 10000.

Example 1:

Input: "abab"
Output: True
Explanation: It's the substring "ab" twice.
Example 2:

Input: "aba"
Output: False
Example 3:

Input: "abcabcabcabc"
Output: True
Explanation: It's the substring "abc" four times. (And the substring "abcabc" twice.)
*/
class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        guard s.count > 1 else {return false}
        let arr = Array(s)
        let len = s.count
        
        for index in (1...len / 2).reversed() {
            if len % index == 0 {
                let subString = arr[0..<index].map{String($0)}.joined()
                var newString = ""
                let numLoops = len / index
                for _ in 0..<numLoops {
                    newString.append(subString)
                }
                if newString == s {return true}
            }
        }
        return false
    }
}
