/*
382. Linked List Random Node

Given a singly linked list, return a random node's value from the linked list. Each node must have the same probability of being chosen.

Follow up:
What if the linked list is extremely large and its length is unknown to you? Could you solve this efficiently without using extra space?

Example:

// Init a singly linked list [1,2,3].
ListNode head = new ListNode(1);
head.next = new ListNode(2);
head.next.next = new ListNode(3);
Solution solution = new Solution(head);

// getRandom() should return either 1, 2, or 3 randomly. Each element should have equal probability of returning.
solution.getRandom();
*/
//Slow solution, not optimized, but works:
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

    var head: ListNode?
    var arr = [Int]()
    
    init(_ head: ListNode?) {
        self.head = head
    }
    
    /** Returns a random node's value. */
    func getRandom() -> Int {
        makeArray()
        let max = arr.count - 1
        let index = Int.random(in: 0...max)
        return arr[index]
    }
    
    func makeArray() {
        var current: ListNode? = head
        while current != nil {
            guard let num = current?.val else {return}
            self.arr.append(num)
            current = current?.next
        }
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(head)
 * let ret_1: Int = obj.getRandom()
 */
