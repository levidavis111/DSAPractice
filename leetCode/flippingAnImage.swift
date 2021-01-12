/*
832. Flipping an Image

Given a binary matrix A, we want to flip the image horizontally, then invert it, and return the resulting image.

To flip an image horizontally means that each row of the image is reversed.  For example, flipping [1, 1, 0] horizontally results in [0, 1, 1].

To invert an image means that each 0 is replaced by 1, and each 1 is replaced by 0. For example, inverting [0, 1, 1] results in [1, 0, 0].

Example 1:

Input: [[1,1,0],[1,0,1],[0,0,0]]
Output: [[1,0,0],[0,1,0],[1,1,1]]
Explanation: First reverse each row: [[0,1,1],[1,0,1],[0,0,0]].
Then, invert the image: [[1,0,0],[0,1,0],[1,1,1]]
Example 2:

Input: [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]
Output: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
Explanation: First reverse each row: [[0,0,1,1],[1,0,0,1],[1,1,1,0],[0,1,0,1]].
Then invert the image: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
Notes:

1 <= A.length = A[0].length <= 20
0 <= A[i][j] <= 1
*/
class Solution {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        var output = A
        let numRows = A.count
        let numCols = A[0].count
        
        for rowIndex in 0..<numRows {
            let rowCount = output[rowIndex].count
            for colIndex in 0...(rowCount / 2) {
                let secondCol = rowCount - 1 - colIndex
                if colIndex > secondCol {break}
                if colIndex == secondCol {
                    if output[rowIndex][colIndex] == 1 {
                        output[rowIndex][colIndex] = 0
                    } else {
                        output[rowIndex][colIndex] = 1
                    }
                } else {
                    if output[rowIndex][colIndex] == 1 {
                        output[rowIndex][colIndex] = 0
                    } else {
                        output[rowIndex][colIndex] = 1
                    }
                    
                    if output[rowIndex][secondCol] == 1 {
                        output[rowIndex][secondCol] = 0
                    } else {
                        output[rowIndex][secondCol] = 1
                    }
                    output[rowIndex].swapAt(colIndex, secondCol)
                }
            }
        }
        
        return output
    }
}
//A little cleaner with ternary and while statement:
class Solution {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        guard A.count > 0 else {return A}
        
        let rowCount = A.count
        let colCount = A[0].count
        var output = [[Int]]()
        
        for row in 0..<rowCount {
            var arr = A[row]
            var left = 0
            var right = arr.count - 1
            while left <= right {
                if left == right {
                    arr[left] = arr[left] == 0 ? 1 : 0
                    break
                }
                arr[left] = arr[left] == 0 ? 1 : 0
                arr[right] = arr[right] == 0 ? 1 : 0
                arr.swapAt(left, right)
                left += 1
                right -= 1
            }
            output.append(arr)
        }
        return output
    }
}
