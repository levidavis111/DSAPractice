/*
You have a linked list ↴ and want to find the kkth to last node.

Write a function kthToLastNode() that takes an integer kk and the headNode of a singly-linked list, and returns the kkth to last node in the list.

For example:

  class LinkedListNode<Value: Equatable> {

    var value: Value
    var next: LinkedListNode?

    init(_ value: Value) {
        self.value = value
    }
 }

let a = LinkedListNode(1)
let b = LinkedListNode(2)
let c = LinkedListNode(3)
let d = LinkedListNode(4)
let e = LinkedListNode(5)

a.next = b
b.next = c
c.next = d
d.next = e

// returns the node with value 4 (the 2nd to last node)
var node = kthToLastNode(at: 2, forHead: a)

Swift
Breakdown
It might be tempting to iterate through the list until we reach the end and then walk backward kk nodes.

But we have a singly linked list! We can’t go backward. What else can we do?

What if we had the length of the list?
*/
enum NodeError: Error, CustomStringConvertible {
    case lessThanFirst
    case largerThanLength
    
    var description: String {
        switch self {
            case .lessThanFirst:
            return "Less than first"
            case .largerThanLength:
            return "K is larger than the length of the list"
        }
    }
}

class LinkedListNode<Value: Equatable> {

    var value: Value
    var next: LinkedListNode?

    init(_ value: Value) {
        self.value = value
    }
}

func kthToLastNode(at k: Int, forHead head: LinkedListNode<Int>) throws -> LinkedListNode<Int> {
    guard k >= 1 else {throw NodeError.lessThanFirst}
    // return the kth to last node in the linked list
    var current: LinkedListNode<Int>? = head
    var len = 0
    
    while current != nil {
        len += 1
        current = current?.next
    }
    
    guard k <= len else {throw NodeError.largerThanLength}
    
    current = head
    
    for _ in 0..<(len - k) {
        current = current?.next
    }
    
    guard let output = current else {throw NodeError.largerThanLength}
    
    return output
}
