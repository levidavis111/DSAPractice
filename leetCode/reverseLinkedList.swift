/*
Reverse a singly linked list.

Example:

Input: 1->2->3->4->5->NULL
Output: 5->4->3->2->1->NULL
Follow up:

A linked list can be reversed either iteratively or recursively. Could you implement both?
*/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil else {return nil}
        guard head?.next != nil else {return head}
        
        var head: ListNode? = head
        var prev: ListNode? = nil
        
        while head != nil {
            let next = head?.next
            head?.next = prev
            prev = head
            head = next
        }
        return prev
    }
}
