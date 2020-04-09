/*
Given a linked list, return the node where the cycle begins. If there is no cycle, return null.

To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.

Note: Do not modify the linked list.
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
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else {return nil}
        var walker: ListNode? = head
        var runner: ListNode? = head
        var seeker: ListNode? = head
        
        while runner?.next != nil && runner?.next?.next != nil {
            runner = runner?.next?.next
            walker = walker?.next
            if walker === runner {
                while walker !== seeker {
                    walker = walker?.next
                    seeker = seeker?.next
                }
                return seeker
            }
        }
        
        return nil
    }
}
