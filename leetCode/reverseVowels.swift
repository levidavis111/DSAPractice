/*
345. Reverse Vowels of a String

Write a function that takes a string as input and reverse only the vowels of a string.

Example 1:

Input: "hello"
Output: "holle"
Example 2:

Input: "leetcode"
Output: "leotcede"
Note:
The vowels does not include the letter "y".
*/
class Solution {
    func reverseVowels(_ s: String) -> String {
        guard s.count > 1 else {return s}
        let vowels: Set<Character> = ["a","e","i","o","u", "A", "E", "I", "O", "U"]
        var sArr = Array(s)
        var left = 0
        var right = sArr.count - 1
        var output = ""
        
        while left < right {
            let leftChar = sArr[left]
            let rightChar = sArr[right]
            
            if vowels.contains(leftChar) && vowels.contains(rightChar) {
                sArr.swapAt(left, right)
                left += 1
                right -= 1
            } else if vowels.contains(leftChar) {
                right -= 1
            } else if vowels.contains(rightChar) {
                left += 1
            } else {
                left += 1
                right -= 1
            }
        }
        
        for char in sArr {
            output.append(char)
        }
        return output
    }
}

//Working with String indices seems to be much slower:
class Solution {
    func reverseVowels(_ s: String) -> String {
        guard s.count > 1 else {return s}
        let vowels: Set<Character> = ["a","e","i","o","u", "A", "E", "I", "O", "U"]
        var output = s
        var left = output.startIndex
        var right = output.index(before: s.endIndex)
        
        
        while left < right {
            let leftChar = output[left]
            let rightChar = output[right]
            
            if vowels.contains(leftChar) && vowels.contains(rightChar) {
                output.replaceSubrange(left...left, with: String(rightChar))
                output.replaceSubrange(right...right, with: String(leftChar))
                left = output.index(after: left)
                right = output.index(before: right)
            } else if vowels.contains(leftChar) {
                right = output.index(before: right)
            } else if vowels.contains(rightChar) {
                left = output.index(after: left)
            } else {
                left = output.index(after: left)
                right = output.index(before: right)
            }
        }
        
        return output
    }
}
