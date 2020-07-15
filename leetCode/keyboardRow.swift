/*
500. Keyboard Row

Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard like the image below.
 
Example:

Input: ["Hello", "Alaska", "Dad", "Peace"]
Output: ["Alaska", "Dad"]
 

Note:

You may use one character in the keyboard more than once.
You may assume the input string will only contain letters of alphabet.
*/
class Solution {
    func findWords(_ words: [String]) -> [String] {
        guard words.count > 0 else {return []}
        
        let row1: Set<String> = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
        let row2: Set<String> = ["a", "s", "d", "f", "g", "h", "j", "k", "l"]
        let row3: Set<String> = ["z", "x", "c", "v", "b", "n", "m"]
        var currentRow = ""
        var output = [String]()
        
        for word in words {
            for char in word {
                let lower = char.lowercased()
                if row1.contains(lower) {
                    if currentRow == "" {
                        currentRow = "row1"
                    } else if currentRow != "row1" {
                        currentRow = ""
                        break
                    } 
                    
                } else if row2.contains(lower) {
                    if currentRow == "" {
                        currentRow = "row2"
                    } else if currentRow != "row2" {
                        currentRow = ""
                        break
                    }
                } else if row3.contains(lower) {
                    if currentRow == "" {
                        currentRow = "row3"
                    } else if currentRow != "row3" {
                        currentRow = ""
                        break
                    }
                }
                
            }
            
            if currentRow != "" {
                output.append(word)
            }
            currentRow = ""
        }
        
        return output
    }
}
