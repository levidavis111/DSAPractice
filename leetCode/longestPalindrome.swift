/*
409. Longest Palindrome

Given a string which consists of lowercase or uppercase letters, find the length of the longest palindromes that can be built with those letters.

This is case sensitive, for example "Aa" is not considered a palindrome here.

Note:
Assume the length of given string will not exceed 1,010.

Example:

Input:
"abccccdd"

Output:
7

Explanation:
One longest palindrome that can be built is "dccaccd", whose length is 7.
*/
class Solution {
    func longestPalindrome(_ s: String) -> Int {
        guard s.count > 0 else {return 0}
        var unPaired = Set<Character>()
        var length = 0
        
        for char in s {
            if unPaired.contains(char) {
                unPaired.remove(char)
                length += 2
            } else {
                unPaired.insert(char)
            }
        }
        
        if !unPaired.isEmpty {
            length += 1
        }
        
        return length
    }
}
