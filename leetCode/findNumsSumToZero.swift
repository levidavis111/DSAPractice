/*
1304. Find N Unique Integers Sum up to Zero

Given an integer n, return any array containing n unique integers such that they add up to 0.

Example 1:

Input: n = 5
Output: [-7,-1,1,3,4]
Explanation: These arrays also are accepted [-5,-1,1,2,3] , [-3,-1,2,-2,4].
Example 2:

Input: n = 3
Output: [-1,0,1]
Example 3:

Input: n = 1
Output: [0]
 

Constraints:

1 <= n <= 1000
*/
class Solution {
    func sumZero(_ n: Int) -> [Int] {
        guard n > 1 else {return [0]}
        
        var output = Array(repeating: 0, count: n)
        var num = n / 2
        var index = 0
        
        while num > 0 {
            output[index] = num
            output[index + 1] = -num
            num -= 1
            index += 2
        }
        return output
    }
}
