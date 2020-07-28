/*
463. Island Perimeter

You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water.

Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).

The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.

Example:

Input:
[[0,1,0,0],
 [1,1,1,0],
 [0,1,0,0],
 [1,1,0,0]]

Output: 16

Explanation: The perimeter is the 16 yellow stripes in the image below:
*/
class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 && grid[0].count > 0 else {return 0}
        
        var perimeter = 0
        
        for row in 0..<grid.count {
            for column in 0..<grid[0].count {
                let item = grid[row][column]
                if item == 1 {
                    perimeter += 4
                    if row > 0 && grid[row - 1][column] == 1 {
                        perimeter -= 2
                    }
                    if column > 0 && grid[row][column - 1] == 1 {
                        perimeter -= 2
                    }
                }
            }
        }
        
        return perimeter
    }
}
