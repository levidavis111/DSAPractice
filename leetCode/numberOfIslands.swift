/*
200. Number of Islands

Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

Example 1:

Input:
11110
11010
11000
00000

Output: 1
Example 2:

Input:
11000
11000
00100
00011

Output: 3
*/
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 else {return 0}
     
        var grid = grid
        let n = grid.count
        let m = grid[0].count
        var count = 0
        
        for row in 0..<n {
            for col in 0..<m {
                if grid[row][col] == "1" {
                    count += 1
                    callBFS(&grid, row, col)
                }
            }
        }
        
        return count
    }
    
    private func callBFS(_ grid: inout [[Character]], _ row: Int, _ col: Int) {
        if row < 0 || row >= grid.count || col < 0 || col >= grid[row].count {return}
        guard grid[row][col] == "1" else {return}
        
        grid[row][col] = "0"
        callBFS(&grid, row + 1, col)
        callBFS(&grid, row - 1, col)
        callBFS(&grid, row, col + 1)
        callBFS(&grid, row, col - 1)
    }
}
