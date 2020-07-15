/*
151. Reverse Words in a String

Given an input string, reverse the string word by word.

Example 1:

Input: "the sky is blue"
Output: "blue is sky the"
Example 2:

Input: "  hello world!  "
Output: "world! hello"
Explanation: Your reversed string should not contain leading or trailing spaces.
Example 3:

Input: "a good   example"
Output: "example good a"
Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
 

Note:

A word is defined as a sequence of non-space characters.
Input string may contain leading or trailing spaces. However, your reversed string should not contain leading or trailing spaces.
You need to reduce multiple spaces between two words to a single space in the reversed string.

Follow up:

For C programmers, try to solve it in-place in O(1) extra space.
*/
class Solution {
    func reverseWords(_ s: String) -> String {
        
        var split = s.split{$0.isWhitespace}
        split.reverse()
        
        return split.joined(separator: " ")
    }
}

class Solution {
    func reverseWords(_ s: String) -> String {
        var split = s.split{$0.isWhitespace}
        guard split.count > 0 else {return ""}
        var left = 0
        var right = split.count - 1
        
        while left < right {
            let leftWord = split[left]
            let rightWord = split[right]
            split[left] = rightWord
            split[right] = leftWord
            left += 1
            right -= 1
        }
        return split.joined(separator: " ")
    }
    
}
