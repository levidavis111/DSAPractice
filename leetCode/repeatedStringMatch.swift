/*
686. Repeated String Match

Given two strings A and B, find the minimum number of times A has to be repeated such that B is a substring of it. If no such solution, return -1.

For example, with A = "abcd" and B = "cdabcdab".

Return 3, because by repeating A three times (“abcdabcdabcd”), B is a substring of it; and B is not a substring of A repeated two times ("abcdabcd").

Note:
The length of A and B will be between 1 and 10000.
*/
//Pretty slow but works
class Solution {
    func repeatedStringMatch(_ A: String, _ B: String) -> Int {
        guard Set(B).isSubset(of: Set(A)) else {return -1}
        
        var repeatedA = A
        var count = 1
        
        while repeatedA.count < B.count {
            repeatedA += A
            count += 1
        }
        
        if repeatedA.contains(B) {
            return count
        } else if repeatedA.appending(A).contains(B) {
            return count + 1
        }
        return -1
    }
}
