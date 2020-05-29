/*
You are climbing a stair case. It takes n steps to reach to the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

Note: Given n will be a positive integer.
*/
class Solution {
    func climbStairs(_ n: Int) -> Int {
        
        guard n >= 3 else {return n}
        
        var a = 1
        var b = 2
        var c = 0
        
        for i in 2..<n {
            c = a + b
            a = b
            b = c
        }
        
        return c
        
    }
}
