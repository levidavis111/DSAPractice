/*
20. Valid Parentheses

Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Note that an empty string is also considered valid.

Example 1:

Input: "()"
Output: true
Example 2:

Input: "()[]{}"
Output: true
Example 3:

Input: "(]"
Output: false
Example 4:

Input: "([)]"
Output: false
Example 5:

Input: "{[]}"
Output: true
*/
class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count > 0 else {return true}
        guard s.count % 2 == 0 else {return false}
        let dict = ["{":"}", "(":")", "[":"]"]
        let openings = Set("({[")
        var stack = [Character]()
        
        for char in s {
            if openings.contains(char) {
                stack.append(char)
            } else {
                if !stack.isEmpty {
                    guard let opening = stack.popLast() else {return false}
                    if let closing = dict[String(opening)] {
                        if String(char) != closing {
                            return false
                        }
                    }
                }
            }
        }
        
        return stack.isEmpty
    }
}
