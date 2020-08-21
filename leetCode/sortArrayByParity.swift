/*
905. Sort Array By Parity

Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.

You may return any answer array that satisfies this condition.

 

Example 1:

Input: [3,1,2,4]
Output: [2,4,3,1]
The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
 

Note:

1 <= A.length <= 5000
0 <= A[i] <= 5000
*/
class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        guard A.count > 1 else {return A}
        var output = Array(repeating: 0, count: A.count)
        var evenIndex = 0
        var oddIndex = A.count - 1
        
        for num in A {
            if num % 2 == 0 {
                output[evenIndex] = num
                evenIndex += 1
            } else {
                output[oddIndex] = num
                oddIndex -= 1
            }
        }
        
        return output
    }
}
