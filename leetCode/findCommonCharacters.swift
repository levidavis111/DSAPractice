/*
1002. Find Common Characters

Given an array A of strings made only from lowercase letters, return a list of all characters that show up in all strings within the list (including duplicates).  For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.

You may return the answer in any order.

Example 1:

Input: ["bella","label","roller"]
Output: ["e","l","l"]
Example 2:

Input: ["cool","lock","cook"]
Output: ["c","o"]

Note:

1 <= A.length <= 100
1 <= A[i].length <= 100
A[i][j] is a lowercase letter
*/
class Solution {
    func commonChars(_ A: [String]) -> [String] {
        guard A.count > 0 else {return []}
        
        var firstMap = [Character: Int]() //[Letter: Occurances]
        var output = [String]()
        
        for char in A[0] {
            firstMap[char, default: 0] += 1
        }
        
        for word in A[1...] {
            var secondMap = [Character: Int]()
            
            for char in word {
                if let _ = firstMap[char] {
                    secondMap[char, default: 0] += 1
                }
            }
            firstMap = reduceMaps(firstMap, secondMap)
        }
        
        for (key, value) in firstMap {
            for _ in 0..<value {
                output.append(String(key))
            }
        }
        
        return output
    }
    private func reduceMaps(_ first: [Character: Int], _ second: [Character: Int]) -> [Character: Int] {
        var newMap = [Character: Int]()
        
        for (key, value) in first {
            if let secondValue = second[key] {
                newMap[key] = min(value, secondValue)
            }
        }
        
        return newMap
    }
}
