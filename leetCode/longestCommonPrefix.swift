/*
14. Longest Common Prefix

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

Example 1:

Input: ["flower","flow","flight"]
Output: "fl"
Example 2:

Input: ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
*/
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else {return ""}
        guard strs.count > 1 else {return strs[0]}
        var commonPrefix = ""
        
        for char in strs[0] {
            commonPrefix.append(char)
            for word in strs[1...] {
                if !word.hasPrefix(commonPrefix) {
                    return String(commonPrefix.dropLast())
                }
            }
        }
        return commonPrefix
    }
}
