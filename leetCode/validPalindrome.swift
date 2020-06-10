/*
125. Valid Palindrome

Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

Note: For the purpose of this problem, we define empty string as valid palindrome.

Example 1:

Input: "A man, a plan, a canal: Panama"
Output: true
Example 2:

Input: "race a car"
Output: false
*/
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        guard s.count > 1 else {return true}
        
        let arr = Array(s.lowercased().unicodeScalars)
        let set = CharacterSet.alphanumerics
        var left = 0
        var right = arr.count - 1
        
        while left < right {
            var leftChar = arr[left], rightChar = arr[right]
            while left < right && !set.contains(leftChar) {
                left += 1
                leftChar = arr[left]
            }
            while left < right && !set.contains(rightChar) {
                right -= 1
                rightChar = arr[right]
            }
            
            if leftChar != rightChar {return false}
            left += 1
            right -= 1
        }
       return true
    }
}
