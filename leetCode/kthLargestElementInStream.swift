/*
Design a class to find the kth largest element in a stream. Note that it is the kth largest element in the sorted order, not the kth distinct element.

Your KthLargest class will have a constructor which accepts an integer k and an integer array nums, which contains initial elements from the stream. For each call to the method KthLargest.add, return the element representing the kth largest element in the stream.

Example:

int k = 3;
int[] arr = [4,5,8,2];
KthLargest kthLargest = new KthLargest(3, arr);
kthLargest.add(3);   // returns 4
kthLargest.add(5);   // returns 5
kthLargest.add(10);  // returns 5
kthLargest.add(9);   // returns 8
kthLargest.add(4);   // returns 8
Note:
You may assume that nums' length ≥ k-1 and k ≥ 1.
*/
class KthLargest {
    
    var nums: [Int] = []
    
    let k: Int

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for number in nums {
            add(number)
        }
    }
    
    func add(_ val: Int) -> Int {
        putInSortedPlace(val)
        if k < nums.count {
            nums.remove(at: 0)
        }
       return nums[0]
    }
    
    func putInSortedPlace(_ val: Int) {
        var left = 0
        var right = nums.count - 1
        var middle = 0 
        var index = 0
        while left <= right {
            let middle = (left + right) / 2
            let number = nums[middle]
            if number == val {
                index = middle
                break
            } else if number > val {
                right = middle - 1
            } else {
                left = middle + 1
                index = left
            }
        }
        nums.insert(val, at: index)
    }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */
