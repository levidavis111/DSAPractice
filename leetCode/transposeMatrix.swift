/*
867. Transpose Matrix

Given a matrix A, return the transpose of A.

The transpose of a matrix is the matrix flipped over it's main diagonal, switching the row and column indices of the matrix.

Example 1:

Input: [[1,2,3],[4,5,6],[7,8,9]]
Output: [[1,4,7],[2,5,8],[3,6,9]]
Example 2:

Input: [[1,2,3],[4,5,6]]
Output: [[1,4],[2,5],[3,6]]
*/
class Solution {
    func transpose(_ A: [[Int]]) -> [[Int]] {
        guard A.count > 0, A[0].count > 0 else {return [[Int]]()}
        var output = Array(repeating: Array(repeating: 0, count: A.count), count:                                    A[0].count)
        let rows = A.count
        let columns = A[0].count
        
        for i in 0..<rows {
            for j in 0..<columns {
                output[j][i] = A[i][j]
            }
        }
        
        return output
    }
}
