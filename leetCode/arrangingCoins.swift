/*
441. Arranging Coins

You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins.

Given n, find the total number of full staircase rows that can be formed.

n is a non-negative integer and fits within the range of a 32-bit signed integer.

Example 1:

n = 5

The coins can form the following rows:
¤
¤ ¤
¤ ¤

Because the 3rd row is incomplete, we return 2.
Example 2:

n = 8

The coins can form the following rows:
¤
¤ ¤
¤ ¤ ¤
¤ ¤

Because the 4th row is incomplete, we return 3.
*/
//Really slow answer:
class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        guard n > 0 else {return 0}
        var n = n - 1
        var rows = [1]
        
        while n > 0 {
            let target = rows[rows.count - 1] + 1
            guard n >= target else {return rows.count}
            
            rows.append(target)
            n -= target
        }
        return rows.count
    }
}

//Faster solution takes advantage of this formula: Using arithmetic progression, we get s = n*(a1+an)/2 <= input, a1 = 1, an = a1+(n-1)*d = n, we've got s = n(n+1)/2, then we use binary search to find n

/*
class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        var l = 1
        var r = n
        while l<=r {
            let mid = l+(r-l)/2
            let s = mid*(mid+1)/2
            if s == n {
                return mid
            } else if s>n {
                r = mid-1
            } else {
                l = mid+1
            }
        }
        return r
    }
}
*/
