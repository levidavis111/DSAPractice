/*
118. Pascal's Triangle

Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.

In Pascal's triangle, each number is the sum of the two numbers directly above it.

Example:

Input: 5
Output:
[
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
]
*/
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else {return []}
        var output = [[Int]]()
        output.append([1])
        
        for row in 1..<numRows {
            let prevRow = output[row - 1]
            var currentRow = [Int]()
            currentRow.append(1)
            
            for index in 1..<row {
                currentRow.append(prevRow[index - 1] + prevRow[index])
            }
            currentRow.append(1)
            output.append(currentRow)
        }
        
        
        return output
    }
}
