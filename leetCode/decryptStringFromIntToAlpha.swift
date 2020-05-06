/*
1309. Decrypt String from Alphabet to Integer Mapping

Given a string s formed by digits ('0' - '9') and '#' . We want to map s to English lowercase characters as follows:

Characters ('a' to 'i') are represented by ('1' to '9') respectively.
Characters ('j' to 'z') are represented by ('10#' to '26#') respectively. 
Return the string formed after mapping.

It's guaranteed that a unique mapping will always exist.

Example 1:

Input: s = "10#11#12"
Output: "jkab"
Explanation: "j" -> "10#" , "k" -> "11#" , "a" -> "1" , "b" -> "2".
*/
class Solution {
    func freqAlphabets(_ s: String) -> String {
        print(s)
        guard s.count > 0 else {return ""}
        var output: String = ""
        var dict = [Int : String]()
        let alpha = Array("abcdefghijklmnopqrstuvwxyz")
        var stack = [Character]()
        
        for key in 1...26 {
            dict[key] = String(alpha[key - 1])
        }
        
        for char in s {
            stack.append(char)
        }
        
        while !stack.isEmpty {
            guard let a = stack.popLast() else {return ""}
            
            if a == "#" {
                let b = stack.popLast() ?? "z"
                let c = stack.popLast() ?? "z"
                if let num = Int("\(c)\(b)") {
                    if let decoded = dict[num] {
                        output.insert(contentsOf: decoded, at: output.startIndex)
                    }
                }
               
            }
            else {
                if let num = Int(String(a)) {
                    if let decoded = dict[num] {
                    output.insert(contentsOf: decoded, at: output.startIndex)
                    }
                }
                
            }
        }
        
        return output
    }
}
// 100% speed, 100% memmory approach:
class Solution {
    func freqAlphabets(_ s: String) -> String {
        
        guard s.count > 0 else {return ""}
        var output: String = ""
        var dict = [Int : String]()
        let alpha = Array("abcdefghijklmnopqrstuvwxyz")
        let arr = Array(s)
        var index = arr.count - 1
        
        for key in 1...26 {
            dict[key] = String(alpha[key - 1])
        }
        
        while index >= 0 {
            let char = arr[index]
            
            if char == "#" {
                let a = arr[index - 2]
                let b = arr[index - 1]
                if let num = Int("\(a)\(b)") {
                    if let decoded = dict[num] {
                        output.insert(contentsOf: decoded, at: output.startIndex)
                    }
                }
                
                index -= 3
                
            } else {
                if let num = Int("\(char)") {
                    if let decoded = dict[num] {
                        output.insert(contentsOf: decoded, at: output.startIndex)
                        index -= 1
                    }
                }
            }
        }
        
        return output
    }
}
