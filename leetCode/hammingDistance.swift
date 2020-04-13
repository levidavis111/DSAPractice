/*
The hamming distance between two integers is the number of postions where the corresponding bits are different. 
Given two integers x and y calculate the hamming distance.
*/

class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        return (x ^ y).nonzeroBitCount
    }
}

/*
Manual approach:
func hammingDistance(_ x: Int, _ y: Int) -> Int {
    var x = x
    var y = y
    var result = 0
    
    while x > 0 || y > 0 {
        result += (x % 2) ^ (y % 2)
        
        x /= 2
        y /= 2
    }
    return result
}
*/

/*
Another Approach:
class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var count: Int = 0
        var diff = x^y
        
        while diff != 0 {
            count += diff & 1
            diff = diff >> 1
        }
        
        return count
    }
}

And another:

func hammingDistance(_ x: Int, _ y: Int) -> Int {
    var x = x
    var y = y
    var result = 0
    
    while x > 0 || y > 0 {
        result += (x % 2) ^ (y % 2)
        
        x = x >> 1
        y = y >> 1
    }
    return result
}
*
