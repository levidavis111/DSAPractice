/*
557. Reverse Words in a String III

Given a string, you need to reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.

Example 1:
Input: "Let's take LeetCode contest"
Output: "s'teL ekat edoCteeL tsetnoc"
Note: In the string, each word is separated by single space and there will not be any extra space in the string.
*/
class Solution {
    func reverseWords(_ s: String) -> String {
        guard s.count > 1 else {return s}
        var output = s
        var currentWordStartIndex = s.startIndex
        
        for index in output.indices {
            let char = output[index]
            
            if char == " " {
                reverseWord(&output, currentWordStartIndex, index)
                currentWordStartIndex = output.index(after: index)
            }
        }
        reverseWord(&output, currentWordStartIndex, output.endIndex)
        return output
    }
    
    private func reverseWord(_ word: inout String, _ start: String.Index, _ end: String.Index) {
        guard word.count > 1 else {return}
        
        var left = start
        var right = word.index(before: end)
        
        while left < right {
            let leftChar = String(word[left])
            let rightChar = String(word[right])
            word.replaceSubrange(left...left, with: rightChar)
            word.replaceSubrange(right...right, with: leftChar)
            
            left = word.index(after: left)
            right = word.index(before: right)
            
        }
    }
}

//Converting to arrays is much faster, but still pretty slow:
class Solution {
    func reverseWords(_ s: String) -> String {
        guard s.count > 1 else {return s}
        var arr = s.components(separatedBy: " ")
        
        for index in 0..<arr.count {
            let word = arr[index]
            arr[index] = reverseWord(word)
        }
        return arr.joined(separator: " ")
    }
    
    private func reverseWord(_ word: String) -> String {
        guard word.count > 1 else {return word}
        var arr = Array(word)
        var left = 0
        var right = word.count - 1
        var output = ""
        
        while left < right {
            arr.swapAt(left, right)
            left += 1
            right -= 1
        }
        
        for char in arr {
            output.append(char)
        }
        
        return output
    }
}
// Shorter and a little faster:
class Solution {
    func reverseWords(_ s: String) -> String {
        guard s.count > 1 else {return s}
        var arr = s.components(separatedBy: " ")
 
        for index in 0..<arr.count {
            let word = String(arr[index].reversed())
            arr[index] = word
        }
        
        return arr.joined(separator: " ")
    }
}
//Another variation:
class Solution {
    func reverseWords(_ s: String) -> String {
        guard s.count > 1 else {return s}
        var arr = s.components(separatedBy: " ")
        var output = ""
        for index in 0..<arr.count {
            let word = String(arr[index].reversed())
            output.append(word)
            if index < arr.count - 1 {
                output.append(" ")
            }
        }
        
        return output
    }
}
