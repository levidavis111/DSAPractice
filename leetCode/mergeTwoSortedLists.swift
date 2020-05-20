/*
21. Merge Two Sorted Lists

Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

Example:

Input: 1->2->4, 1->3->4
Output: 1->1->2->3->4->4
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {
            return nil
        } else if l1 == nil {
            return l2
        } else if l2 == nil {
            return l1
        }
        
        var newHead: ListNode? = nil
        var newCurrent: ListNode? = nil
        var current1: ListNode? = l1
        var current2: ListNode? = l2
        
       while current1 != nil && current2 != nil {
           if let val1 = current1?.val, let val2 = current2?.val {
               if val1 <= val2 {
                   if newHead == nil {
                       newHead = ListNode(val1)
                       newCurrent = newHead
                       current1 = current1?.next
                   } else {
                       newCurrent?.next = ListNode(val1)
                       newCurrent = newCurrent?.next
                       current1 = current1?.next
                   }
               } else {
                   if newHead == nil {
                       newHead = ListNode(val2)
                       newCurrent = newHead
                       current2 = current2?.next
                   } else {
                       newCurrent?.next = ListNode(val2)
                       newCurrent = newCurrent?.next
                       current2 = current2?.next
                   }
               }
           }
       }
        
        if current1 != nil {
            newCurrent?.next = current1
        } else if current2 != nil {
            newCurrent?.next = current2
        }
        
        return newHead
    }
}
