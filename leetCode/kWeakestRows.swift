/*
1337. The K Weakest Rows in a Matrix

Given a m * n matrix mat of ones (representing soldiers) and zeros (representing civilians), return the indexes of the k weakest rows in the matrix ordered from the weakest to the strongest.

A row i is weaker than row j, if the number of soldiers in row i is less than the number of soldiers in row j, or they have the same number of soldiers but i is less than j. Soldiers are always stand in the frontier of a row, that is, always ones may appear first and then zeros.

 

Example 1:

Input: mat = 
[[1,1,0,0,0],
 [1,1,1,1,0],
 [1,0,0,0,0],
 [1,1,0,0,0],
 [1,1,1,1,1]], 
k = 3
Output: [2,0,3]
Explanation: 
The number of soldiers for each row is: 
row 0 -> 2 
row 1 -> 4 
row 2 -> 1 
row 3 -> 2 
row 4 -> 5 
Rows ordered from the weakest to the strongest are [2,0,3,1,4]
*/
class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
//         [index : strength]
        var rowDict = [Int : Int]()
        var output = [Int]()
        for (index, row) in mat.enumerated() {
            let strength = row.reduce(0, +)
            
            rowDict[index] = strength
        }
        
        let rowsArr = Array(rowDict).sorted(by: {
            if $0.value == $1.value {
                return $0.key < $1.key
            } else {
                return $0.value < $1.value
            }
        })
        
        for index in 0..<k {
            let row = rowsArr[index]
            output.append(row.key)
        }
        
        return output
    }
}
