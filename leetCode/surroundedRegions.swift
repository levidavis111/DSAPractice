/*
130. Surrounded Regions

Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.

A region is captured by flipping all 'O's into 'X's in that surrounded region.

Example:

X X X X
X O O X
X X O X
X O X X
After running your function, the board should be:

X X X X
X X X X
X X X X
X O X X
Explanation:

Surrounded regions shouldn’t be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.
*/
class Solution {
    func solve(_ board: inout [[Character]]) {
        guard board.count > 0 && board[0].count > 0 else {return}
        
        let rows = board.count
        let columns = board[0].count
        
        for row in 0..<rows {
            if board[row][0] == "O" {
                boundaryDFS(&board, row, 0)
            }
            if board[row][columns - 1] == "O" {
                boundaryDFS(&board, row, columns - 1)
            }
                
        }
        
        for col in 0..<columns {
            if board[0][col] == "O" {
                boundaryDFS(&board, 0, col)
            }
            
            if board[rows - 1][col] == "O" {
                boundaryDFS(&board, rows - 1, col)
            }
        }
        
        for row in 0..<rows {
            for col in 0..<columns {
                if board[row][col] == "O" {
                    board[row][col] = "X"
                } else if board[row][col] == "*" {
                    board[row][col] = "O"
                }
            }
        }
        
    }
    
    private func boundaryDFS(_ board: inout [[Character]], _ row: Int, _ col: Int) {
        guard row >= 0 && row < board.count && col >= 0 && col < board[0].count else {return}
        
        if board[row][col] == "O" {board[row][col] = "*"}
        if row > 0 && board[row - 1][col] == "O" {boundaryDFS(&board, row - 1, col)}
        if row < board.count - 1 && board[row + 1][col] == "O" {boundaryDFS(&board, row + 1, col)}
        if col > 0 && board[row][col - 1] == "O" {boundaryDFS(&board, row, col - 1)}
        if col < board[row].count - 1 && board[row][col + 1] == "O" {boundaryDFS(&board, row, col + 1)}
        
    }
}
