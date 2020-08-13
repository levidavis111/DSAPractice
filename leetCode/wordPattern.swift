/*
290. Word Pattern

Given a pattern and a string str, find if str follows the same pattern.

Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in str.

Example 1:

Input: pattern = "abba", str = "dog cat cat dog"
Output: true
Example 2:

Input:pattern = "abba", str = "dog cat cat fish"
Output: false
Example 3:

Input: pattern = "aaaa", str = "dog cat cat dog"
Output: false
Example 4:

Input: pattern = "abba", str = "dog dog dog dog"
Output: false
Notes:
You may assume pattern contains only lowercase letters, and str contains lowercase letters that may be separated by a single space.
*/
class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let patternArr = Array(pattern)
        let strArr = str.components(separatedBy: " ")
        guard patternArr.count == strArr.count else {return false}
        var hash = [Character:String]() //[pattern:word]
        
        for index in 0..<patternArr.count {
            let letter = patternArr[index]
            let word = strArr[index]
            if hash.keys.contains(letter) {
                if let value = hash[letter] {
                    if value != word {return false}
                }
            } else {
                if hash.values.contains(word) {
                    return false
                } else {
                    hash[letter] = word
                }
            }
        }
        return true
    }
}
