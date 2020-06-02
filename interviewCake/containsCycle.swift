/*
You have a singly-linked list ↴ and want to check if it contains a cycle.

A singly-linked list is built with nodes, where each node has:

node.next—the next node in the list.
node.value—the data held in the node. For example, if our linked list stores people in line at the movies, node.value might be the person's name.
For example:

  class LinkedListNode<Value: Equatable> {

    var value: Value
    var next: LinkedListNode?

    init(_ value: Value) {
        self.value = value
    }
}

Swift
A cycle occurs when a node’s next points back to a previous node in the list. The linked list is no longer linear with a beginning and end—instead, it cycles through a loop of nodes.

Write a function containsCycle() that takes the first node in a singly-linked list and returns a boolean indicating whether the list contains a cycle.

Gotchas
Careful—a cycle can occur in the middle of a list, or it can simply mean the last node links back to the first node. Does your function work for both?

We can do this in O(n) time and O(1) space!
*/
class LinkedListNode<Value: Equatable> {

    var value: Value
    var next: LinkedListNode?

    init(_ value: Value) {
        self.value = value
    }
}

func containsCycle<T>(firstNode: LinkedListNode<T>) -> Bool {
    guard firstNode.next != nil else {return false}
    var runner: LinkedListNode? = firstNode
    var walker: LinkedListNode? = firstNode
    
    while runner != nil {
        runner = runner?.next?.next
        walker = walker?.next
        if runner === walker {
            return true
        }
    }

    return false
}
