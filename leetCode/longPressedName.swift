/*
925. Long Pressed Name

Your friend is typing his name into a keyboard.  Sometimes, when typing a character c, the key might get long pressed, and the character will be typed 1 or more times.

You examine the typed characters of the keyboard.  Return True if it is possible that it was your friends name, with some characters (possibly none) being long pressed.

 

Example 1:

Input: name = "alex", typed = "aaleex"
Output: true
Explanation: 'a' and 'e' in 'alex' were long pressed.
Example 2:

Input: name = "saeed", typed = "ssaaedd"
Output: false
Explanation: 'e' must have been pressed twice, but it wasn't in the typed output.
*/
class Solution {
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        guard name != typed else {return true}
        
        let nameArr = Array(name)
        let typedArr = Array(typed)
        
        var nameIndex = 0
        
        for index in 0..<typedArr.count {
            if nameIndex == nameArr.count {
                if typedArr[index] != typedArr[index - 1] {
                    return false
                }
                continue
            }
            
            if nameArr[nameIndex] == typedArr[index] {
                nameIndex += 1
            } else if index > 0 && typedArr[index] == typedArr[index - 1] {
                continue
            } else {
                return false
            }
        }
        return nameIndex == nameArr.count
    }
}
