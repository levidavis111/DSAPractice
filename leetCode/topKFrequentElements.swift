/*
347. Top K Frequent Elements

Given a non-empty array of integers, return the k most frequent elements.

Example 1:

Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]
Example 2:

Input: nums = [1], k = 1
Output: [1]
Note:

You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
It's guaranteed that the answer is unique, in other words the set of the top k frequent elements is unique.
You can return the answer in any order.
*/
//I think this is nlogn. Don't know how to do it faster
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > k else {return nums}
        
        var hash = [Int:Int]()//[num:frequency]
        var output = [Int]()
        
        for num in nums {
            if let value = hash[num] {
                hash[num] = value + 1
            } else {
                hash[num] = 1
            }
        }
        
        let sorted = Array(hash).sorted(by: {$0.value > $1.value})
        
        for index in 0..<k {
            let item = sorted[index]
            output.append(item.key)
        } 
        
        return output
    }
}
