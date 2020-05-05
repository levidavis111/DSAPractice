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
// Binary Search
class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
       var count: Int = 0
        
        for row in grid {
            guard let index = findFirstNegative(row) else {continue}
            count += row.count - index
        }
        return count
    }
    
    func findFirstNegative(_ arr: [Int]) -> Int? {
        guard arr[arr.count - 1] < 0 else {return nil}
        if arr[0] < 0 {return 0}
        
        var left = 0
        var right = arr.count - 1
        
        while left < right {
            let middle = (left + right) / 2
            let number = arr[middle]
            guard middle > 0 else {
                return middle + 1
            }
            let previousNumber = arr[middle - 1]
            if number < 0 && previousNumber >= 0 {
                return middle
            } else if number >= 0 {
                left = middle + 1
            } else if number < 0 {
                right = middle - 1
            }
        }
        
        return left
        
    }
}
