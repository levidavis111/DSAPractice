/*
Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.
*/

struct Stack<T> {
    var arr = [T]()
    var isEmpty: Bool {
        return arr.isEmpty
    }
    
    mutating func push(element: T) {
        arr.append(element)
    }
    
    mutating func pop() -> T? {
        return arr.popLast()
    }
    
    func peek() -> T? {
        return arr[arr.count - 1]
    }
}

class Solution {
    
    
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        var stackS = Stack<Character>()
        var stackT = Stack<Character>()
        
        for char in S {
            if char != "#" {
                stackS.push(element: char)
            } else if !stackS.isEmpty {
                stackS.pop()
            }
        }
        
        for char in T {
            if char != "#" {
                stackT.push(element: char)
            } else if !stackT.isEmpty {
                stackT.pop()
            }
        }
        
        while !stackS.isEmpty {
            let currentS = stackS.pop()
            if stackT.isEmpty || stackT.pop() != currentS {
                return false
            }
        }
        return stackS.isEmpty && stackT.isEmpty
    }
}
