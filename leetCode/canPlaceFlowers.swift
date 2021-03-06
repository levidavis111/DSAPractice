/*
605. Can Place Flowers

Suppose you have a long flowerbed in which some of the plots are planted and some are not. However, flowers cannot be planted in adjacent plots - they would compete for water and both would die.

Given a flowerbed (represented as an array containing 0 and 1, where 0 means empty and 1 means not empty), and a number n, return if n new flowers can be planted in it without violating the no-adjacent-flowers rule.

Example 1:
Input: flowerbed = [1,0,0,0,1], n = 1
Output: True
Example 2:
Input: flowerbed = [1,0,0,0,1], n = 2
Output: False
Note:
The input array won't violate no-adjacent-flowers rule.
The input array size is in the range of [1, 20000].
n is a non-negative integer which won't exceed the input array size.
*/
class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        guard flowerbed.count > 0 else {return false}
        let count = flowerbed.count
        var planted = 0
        var prevZero = flowerbed[0] == 0
        
        for index in 0..<count {
            guard planted < n else {return true}
            if flowerbed[index] == 0 {
                if prevZero && (index == count - 1 || flowerbed[index + 1] == 0) {
                    planted += 1
                    prevZero = false
                } else {
                    prevZero = true
                }
            } else {
                prevZero = false
            }
        }
        
        return planted >= n
    }
}
//Tried on my own:
class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        
        var prevPlanted: Bool = false
        let lastIndex = flowerbed.count - 1
        var count = 0
        
        for index in 0..<lastIndex {
            let current = flowerbed[index]
            let next = flowerbed[index + 1]
            
            if current == 1 {
                prevPlanted = true
            } else {
                if !prevPlanted && next == 0 {
                    count += 1
                    prevPlanted = true
                } else {
                    prevPlanted = false
                }
            }
        }
        
        if !prevPlanted && flowerbed[lastIndex] == 0 {
            count += 1
        }
        
        return count >= n
    }
}
