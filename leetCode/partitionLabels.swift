/*
763. Partition Labels

A string S of lowercase English letters is given. We want to partition this string into as many parts as possible so that each letter appears in at most one part, and return a list of integers representing the size of these parts.

Example 1:

Input: S = "ababcbacadefegdehijhklij"
Output: [9,7,8]
Explanation:
The partition is "ababcbaca", "defegde", "hijhklij".
This is a partition so that each letter appears in at most one part.
A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits S into less parts.
 

Note:

S will have length in range [1, 500].
S will consist of lowercase English letters ('a' to 'z') only.
*/
class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        guard S.count > 0 else {return [0]}
        var output = [Int]()
        var hash = [Character:Int]()
        let arr = Array(S)
        
        for index in 0..<arr.count {
            let char = arr[index]
            hash[char] = index
        }
        
        var start = 0
        var end = 0
        
        for index in 0..<arr.count {
            let char = arr[index]
            if let value = hash[char] {
                end = max(end, value)
                if end == index {
                    output.append(end - start + 1)
                    start = index + 1
                }
            }
        }
        return output
    }
}

/*
Loop through and store each character and its last index
Loop through a second time and store the greatest last index seen
When you reach the greatest last index seen, append (lastIndex - startIndex + 1)
Set startIndex = lastIndex + 1

*/
