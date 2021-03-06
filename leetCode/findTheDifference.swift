/*
389. Find the Difference

Given two strings s and t which consist of only lowercase letters.

String t is generated by random shuffling string s and then add one more letter at a random position.

Find the letter that was added in t.

Example:

Input:
s = "abcd"
t = "abcde"

Output:
e

Explanation:
'e' is the letter that was added.
*/
class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var hash = [Character:Int]()
        
        for char in s {
            if let value = hash[char] {
                hash[char] = value + 1
            } else {
                hash[char] = 1
            }
        }
        
        for char in t {
            if let value = hash[char] {
                if value == 0 {
                    return char
                } else {
                    hash[char] = value - 1
                }
            } else {
                return char
            }
        }
        return "1"
    }
}
