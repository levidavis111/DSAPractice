/*
225. Implement Stack using Queues

Implement the following operations of a stack using queues.

push(x) -- Push element x onto stack.
pop() -- Removes the element on top of the stack.
top() -- Get the top element.
empty() -- Return whether the stack is empty.
Example:

MyStack stack = new MyStack();

stack.push(1);
stack.push(2);  
stack.top();   // returns 2
stack.pop();   // returns 2
stack.empty(); // returns false
Notes:

You must use only standard operations of a queue -- which means only push to back, peek/pop from front, size, and is empty operations are valid.
Depending on your language, queue may not be supported natively. You may simulate a queue by using a list or deque (double-ended queue), as long as you use only standard operations of a queue.
You may assume that all operations are valid (for example, no pop or top operations will be called on an empty stack).

NOTE: Interesting question. All the answers I saw used properties like count that are not acually part of a real queue. I simulated a double-ended queue, which is allowed but feels like cheating.
*/
class MyStack {
    
    var DEQueue = [Int]()
 
    var isEmpty: Bool {
        return DEQueue.isEmpty
    }

    /** Push element x onto stack. */
    func push(_ x: Int) {
        DEQueue.append(x)
        
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        return DEQueue.removeLast()
    }
    
    /** Get the top element. */
    func top() -> Int {
       return DEQueue.last!
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
