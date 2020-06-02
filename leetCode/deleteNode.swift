/*
Delete a node from a singly-linked list, ↴ given only a variable pointing to that node.

The input could, for example, be the variable b below:

  class LinkedListNode<Value: Equatable> {

    var value: Value
    var next: LinkedListNode?

    init(_ value: Value) {
        self.value = value
    }
}

let a = LinkedListNode("A")
let b = LinkedListNode("B")
let c = LinkedListNode("C")

a.next = b
b.next = c

try deleteNode(b)

Swift
Gotchas
We can do this in O(1) time and space! But our answer is tricky, and it could have some side effects...
*/
enum NodeError: Error, CustomStringConvertible {
    case isTail
    
    var description: String {
        return "Is Tail"
    }
}

class LinkedListNode<Value: Equatable> {

    var value: Value
    var next: LinkedListNode<Value>?

    init(_ value: Value, next: LinkedListNode? = nil) {
        self.value = value
        self.next = next
    }
}

func deleteNode<T>(_ nodeToDelete: LinkedListNode<T>) throws {
    guard let next = nodeToDelete.next else {throw NodeError.isTail}
    // delete the input node from the linked list
    nodeToDelete.value = next.value
    nodeToDelete.next = next.next

}
