/*
242. Valid Anagram

Given two strings s and t , write a function to determine if t is an anagram of s.

Example 1:

Input: s = "anagram", t = "nagaram"
Output: true
Example 2:

Input: s = "rat", t = "car"
Output: false
Note:
You may assume the string contains only lowercase alphabets.

Follow up:
What if the inputs contain unicode characters? How would you adapt your solution to such case?
*/
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        return s.sorted() == t.sorted()
    }
}

//Also, much faster:
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {return false}
        var sDict = [Character:Int]()
        
        for char in s {
            if let value = sDict[char] {
                sDict[char] = value + 1
            } else {
                sDict[char] = 1
            }
        }
        
        for char in t {
            if let value = sDict[char] {
                if value == 0 {
                    return false
                } else {
                    sDict[char] = value - 1
                }
            } else {
                return false
            }
        }
        return true
    }
}
//Another solution, not really faster:
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {return false}
        
        let sArr = Array(s)
        let tArr = Array(t)
        
        var sHash = [Character:Int]()
        var tHash = [Character:Int]()
        
        for index in 0..<sArr.count {
            let sChar = sArr[index]
            let tChar = tArr[index]
            
            if let sValue = sHash[sChar] {
                sHash[sChar] = sValue + 1
            } else {
                sHash[sChar] = 1
            }
            
            if let tValue = tHash[tChar] {
                tHash[tChar] = tValue + 1
            } else {
                tHash[tChar] = 1
            }
        }
        
        for char in s {
            if let sValue = sHash[char] {
                if let tValue = tHash[char] {
                   if sValue != tValue {
                       return false
                   } 
                } else {
                    return false
                } 
            } else {
                return false
            }
        }
        
        return true
    }
}
