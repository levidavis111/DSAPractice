/*
Design your implementation of the linked list. You can choose to use the singly linked list or the doubly linked list. A node in a singly linked list should have two attributes: val and next. val is the value of the current node, and next is a pointer/reference to the next node. If you want to use the doubly linked list, you will need one more attribute prev to indicate the previous node in the linked list. Assume all nodes in the linked list are 0-indexed.

Implement these functions in your linked list class:

get(index) : Get the value of the index-th node in the linked list. If the index is invalid, return -1.
addAtHead(val) : Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
addAtTail(val) : Append a node of value val to the last element of the linked list.
addAtIndex(index, val) : Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
deleteAtIndex(index) : Delete the index-th node in the linked list, if the index is valid.
*/
class ListNode {
    let val: Int
    var next: ListNode?
    
    init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

class MyLinkedList {
    
    var head: ListNode?

    /** Initialize your data structure here. */
    init() {
        self.head = nil
    }
    
    private func getNode(_ index: Int) -> ListNode? {
        guard index >= 0, head != nil else {return nil}
        if index == 0 {
            return head
        }
        var currentNode: ListNode? = head
        
        for i in 0..<index {
            guard currentNode?.next != nil else {return nil}
            currentNode = currentNode?.next
        }
        
        return currentNode
        
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        guard let node = getNode(index) else {return -1}
        return node.val
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let newHead = ListNode(val, head)
        head = newHead
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        guard head != nil else {addAtHead(val); return}
        var currentNode: ListNode? = head
        
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = ListNode(val)
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        guard index >= 0 else {return}
        if index == 0 {
            addAtHead(val)
        }
        
        guard let prev = getNode(index - 1) else {return}
        let newNode = ListNode(val, prev.next)
        prev.next = newNode
        
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        guard index >= 0 else {return}
        guard head != nil else {return}
        if index == 0 {
            let next = head?.next
            head = nil
            head = next
            return
        }
        
        guard let prev = getNode(index - 1) else {return}
        let newNext: ListNode? = prev.next?.next
        prev.next = nil
        prev.next = newNext
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */
