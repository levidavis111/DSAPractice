/*
1299. Replace Elements with Greatest Element on Right Side

Given an array arr, replace every element in that array with the greatest element among the elements to its right, and replace the last element with -1.

After doing so, return the array.

Example 1:

Input: arr = [17,18,5,4,6,1]
Output: [18,6,6,6,1,-1]
 

Constraints:

1 <= arr.length <= 10^4
1 <= arr[i] <= 10^5

*/
class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        var output = [Int]()
        
        for index in 0..<arr.count {
            guard index < arr.count - 1 else {
                output.append(-1)
                return output
            }
            
            let subrange = arr[(index + 1)...]
            let biggest = subrange.max() ?? 0
            
            output.append(biggest)
            
            
        }
        
        return output
    }
}
//O(n) solution:
class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        var output = arr
        var biggestYet: Int = arr[arr.count - 1]
        output[output.count - 1] = -1
        for index in (0..<arr.count - 1).reversed() {
            let number = output[index]
            output[index] = biggestYet
            
            biggestYet = max(biggestYet, number)
        }
        
        return output
    }
}
