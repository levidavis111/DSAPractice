/*
680. Valid Palindrome II

Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.

Example 1:
Input: "aba"
Output: True
Example 2:
Input: "abca"
Output: True
Explanation: You could delete the character 'c'.
Note:
The string will only contain lowercase characters a-z. The maximum length of the string is 50000.
*/
//This is slow (beats about 50%), but it works
class Solution {
    func validPalindrome(_ s: String) -> Bool {
        guard s.count > 1 else {return true}
        let arr = Array(s)
        return validPalindrome(arr, false)
    }
    func validPalindrome(_ arr: [Character], _ modified: Bool) -> Bool {
        var left = 0
        var right = arr.count - 1
        var arr1 = arr
        var arr2 = arr
        while left < right {
            if arr[left] != arr[right] {
                if modified {
                    return false
                } else {
                    arr1.remove(at: left)
                    arr2.remove(at: right)
                    return validPalindrome(arr1, true) || validPalindrome(arr2, true)
                }
            }
            left += 1
            right -= 1
        }
        return true
    }
}
