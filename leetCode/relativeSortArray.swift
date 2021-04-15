/*
1122. Relative Sort Array

Given two arrays arr1 and arr2, the elements of arr2 are distinct, and all elements in arr2 are also in arr1.

Sort the elements of arr1 such that the relative ordering of items in arr1 are the same as in arr2.  Elements that don't appear in arr2 should be placed at the end of arr1 in ascending order.

Example 1:

Input: arr1 = [2,3,1,3,2,4,6,7,9,2,19], arr2 = [2,1,4,3,9,6]
Output: [2,2,2,1,4,3,3,9,6,7,19]
 

Constraints:

1 <= arr1.length, arr2.length <= 1000
0 <= arr1[i], arr2[i] <= 1000
All the elements of arr2 are distinct.
Each arr2[i] is in arr1.
*/
//Using binary search to insert in place rather than sorting:

class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var set2 = Set(arr2)
        var map = [Int: Int]() //num in arr1: num of occurances
        var outliers = [Int]() //nums in arr1 but not arr2
        var output = [Int]()
        
        //Create map and outlier arr
        
        for num in arr1 {
            if !set2.contains(num) {
                insertInPlace(num, &outliers)
            } else {
                map[num, default: 0] += 1
            }
        }
        
        for num in arr2 {
            if let freq = map[num] {
                for _ in 0..<freq {
                    output.append(num)
                }
            }
        }
        
        for num in outliers {
            output.append(num)
        }
        
        return output
    }
    
    private func insertInPlace(_ num: Int, _ arr: inout [Int]) {
        guard arr.count > 0 else {arr.append(num); return}
        
        var left = 0
        var right = arr.count - 1
        
        while left <= right {
            let middle = (left + right) / 2
            let midNum = arr[middle]
            
            if num == midNum {
                arr.insert(num, at: middle)
                return
            } else if num < midNum {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        arr.insert(num, at: left)
    }
}
