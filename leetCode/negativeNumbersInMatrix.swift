/*
1351. Count Negative Numbers in a Sorted Matrix

Given a m * n matrix grid which is sorted in non-increasing order both row-wise and column-wise. 

Return the number of negative numbers in grid.

Example 1:

Input: grid = [[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]]
Output: 8
Explanation: There are 8 negatives number in the matrix.
*/
class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else {return 0}
        var count: Int = 0
        
        for row in grid {
            for index in (0..<row.count).reversed() {
                let number = row[index]
                if number < 0 {
                    count += 1
                } else {
                    break
                }
            }
        }
        
        return count
    }
}
// Faster:
class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else {return 0}
        var count: Int = 0
        
        for row in grid {
            for (index, number) in row.enumerated() {
                if number < 0 {
                    count += row.count - index
                    break
                }
            }
        }
        
        return count
    }
}
