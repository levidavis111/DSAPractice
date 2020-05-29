/**
83. Remove Duplicates from Sorted List

Given a sorted linked list, delete all duplicates such that each element appear only once.

Example 1:

Input: 1->1->2
Output: 1->2
Example 2:

Input: 1->1->2->3->3
Output: 1->2->3
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
         
        var seen = Set<Int>()
        var current = head
        var prev: ListNode? = nil
        
        while current != nil {
            guard let val = current?.val else {return nil}
            if seen.contains(val) {
                let next = current?.next
                current = nil
                prev?.next = next
            } else {
                seen.insert(val)
                prev = current
            }
            current = prev?.next
        }
        
        return head
    }
}
