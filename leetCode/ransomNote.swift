/*
383. Ransom Note

Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.

Each letter in the magazine string can only be used once in your ransom note.

Example 1:

Input: ransomNote = "a", magazine = "b"
Output: false
Example 2:

Input: ransomNote = "aa", magazine = "ab"
Output: false
Example 3:

Input: ransomNote = "aa", magazine = "aab"
Output: true
 

Constraints:

You may assume that both strings contain only lowercase letters.
*/
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        guard magazine.count >= ransomNote.count else {return false}
        
        var hash = [Character:Int]()
        
        for char in magazine {
            if let value = hash[char] {
                hash[char] = value + 1
            } else {
                hash[char] = 1
            }
        }
        
        for char in ransomNote {
            if let value = hash[char] {
                if value <= 0 {
                    return false
                } else {
                    hash[char] = value - 1
                }
                
            } else {
                return false
            }
        }
        
        return true
    }
}
