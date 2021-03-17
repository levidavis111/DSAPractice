/*
You want to be able to access the largest element in a stack. ↴

You've already implemented this Stack class:

  class Stack<Item> {

    // initialize an empty array to hold our stack items
    private var items: [Item] = []

    // push a new item onto the stack
    func push(_ item: Item) {
        items.append(item)
    }

    // remove and return the last item
    func pop() -> Item? {

        // if the stack is empty, return nil
        // (it would also be reasonable to throw an exception)
        if items.count == 0 {
            return nil
        }
        return items.removeLast()
    }

    // return the last item without removing it
    func peek() -> Item? {
        return items.last
    }
}
Swift
Use your Stack class to implement a new class MaxStack with a method getMax() that returns the largest element in the stack. getMax() should not remove the item.

Your stacks will contain only integers.

Gotchas
What if we push several items in increasing numeric order (like 1, 2, 3, 4...), so that there is a new max after each push()? What if we then pop() each of these items off, so that there is a new max after each pop()? Your algorithm shouldn't pay a steep cost in these edge cases.

You should be able to get a runtime of O(1)O(1) for push(), pop(), and getMax().
*/

class Stack<Item> {

    // initialize an empty array to hold our stack items
    var items: [Item] = []

    // push a new item onto the stack
    func push(_ item: Item) {
        items.append(item)
    }

    // remove and return the last item
    func pop() -> Item? {

        // if the stack is empty, return nil
        // (it would also be reasonable to throw an exception)
        if items.count == 0 {
            return nil
        }
        return items.removeLast()
    }

    // return the last item without removing it
    func peek() -> Item? {
        return items.last
    }
}

class MaxStack {

    // implement the push, pop, and getMax methods
    var stack = Stack<Int>()
    var maxesStack = Stack<Int>()

    func push(_ item: Int) {
        stack.push(item)
        if let peek = maxesStack.peek() {
           if item >= peek {
               maxesStack.push(item)
           }
        } else {
           maxesStack.push(item)
        }
    }

    func pop() -> Int? {
        let item = stack.pop()
        if let lastMax = maxesStack.peek() {
            if lastMax == item {
                let _ = maxesStack.pop()
            }
        }
        return item
    }

    func getMax() -> Int? {
        return maxesStack.peek()
    }
}
