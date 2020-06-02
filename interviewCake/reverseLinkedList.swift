/*
Hooray! It's opposite day. Linked lists go the opposite way today.

Write a function for reversing a linked list. ↴ Do it in place. ↴

Your function will have one input: the head of the list.

Your function should return the new head of the list.

Here's a sample linked list node class:

  class LinkedListNode<Value: Equatable> {

    var value: Value
    var next: LinkedListNode?

    init(_ value: Value) {
        self.value = value
    }
}

Swift
Gotchas
We can do this in O(1) space. So don't make a new list; use the existing list nodes!

We can do this is in O(n) time.

Careful—even the right approach will fail if done in the wrong order.

Try drawing a picture of a small linked list and running your function by hand. Does it actually work?

The most obvious edge cases are:

the list has 0 elements
the list has 1 element
Does your function correctly handle those cases?
*/

class LinkedListNode<Value: Equatable> {

    var value: Value
    var next: LinkedListNode?

    init(_ value: Value) {
        self.value = value
    }
}

func reverseLinkedList<Value>(startingFrom headOfList: LinkedListNode<Value>?) -> LinkedListNode<Value>? {
    guard headOfList != nil else {return nil}
    guard headOfList?.next != nil else {return headOfList}
    // reverse the linked list in place
    var current: LinkedListNode? = headOfList
    var prev: LinkedListNode<Value>? = nil
    
    while current != nil {
        let next = current?.next
        current?.next = prev
        prev = current
        current = next
    }

    return prev
}
