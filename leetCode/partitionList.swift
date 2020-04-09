/*
Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

You should preserve the original relative order of the nodes in each of the two partitions.

Example:

Input: head = 1->4->3->2->5->2, x = 3
Output: 1->2->2->4->3->5
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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        guard head != nil else {return nil}
        
        var smallHead: ListNode? = ListNode(0)
        var largeHead: ListNode? = ListNode(0)
        var smallListCurrent: ListNode? = smallHead
        var largeListCurrent: ListNode? = largeHead
        var currentNode: ListNode? = head
        
        while currentNode != nil {
            let next = currentNode?.next
            if currentNode!.val >= x {
                largeListCurrent?.next = currentNode!
                largeListCurrent = largeListCurrent?.next
            } else {
                smallListCurrent?.next = currentNode!
                smallListCurrent = smallListCurrent?.next
            }
            currentNode?.next = nil
            currentNode = next
        }
        smallListCurrent?.next = largeHead?.next
        largeHead = nil
        smallHead = smallHead?.next
        return smallHead
    }
}
