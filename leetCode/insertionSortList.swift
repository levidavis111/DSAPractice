/*
147. Insertion Sort List

Sort a linked list using insertion sort.

A graphical example of insertion sort. The partial sorted list (black) initially contains only the first element in the list.
With each iteration one element (red) is removed from the input data and inserted in-place into the sorted list
 

Algorithm of Insertion Sort:

Insertion sort iterates, consuming one input element each repetition, and growing a sorted output list.
At each iteration, insertion sort removes one element from the input data, finds the location it belongs within the sorted list, and inserts it there.
It repeats until no input elements remain.

Example 1:

Input: 4->2->1->3
Output: 1->2->3->4
Example 2:

Input: -1->5->3->4->0
Output: -1->0->3->4->5
*/
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        guard head != nil else {return nil}
        
        var current = head
        var arr = [Int]()
        
        while current != nil {
            guard let currentNum = current?.val else {return nil}
            
            insert(currentNum, into: &arr)
            current = current?.next
        }
        let newHead = ListNode(arr[0])
        current = newHead
        
        for num in arr[1...] {
            let newNode = ListNode(num)
            current?.next = newNode
            current = current?.next
        }
        
        return newHead
    }
    
    func insert(_ num: Int, into arr: inout [Int]) {
        guard arr.count > 0 else {arr.append(num); return}
        
        for index in 0..<arr.count {
            let current = arr[index]
            if num <= current {
                arr.insert(num, at: index)
                return
            }
        }
        arr.append(num)
    }
}
