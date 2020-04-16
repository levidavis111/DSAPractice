/*
Implement the following operations of a queue using stacks.

push(x) -- Push element x to the back of queue.
pop() -- Removes the element from in front of queue.
peek() -- Get the front element.
empty() -- Return whether the queue is empty.
Example:

MyQueue queue = new MyQueue();

queue.push(1);
queue.push(2);  
queue.peek();  // returns 1
queue.pop();   // returns 1
queue.empty(); // returns false
Notes:

You must use only standard operations of a stack -- which means only push to top, peek/pop from top, size, and is empty operations are valid.
Depending on your language, stack may not be supported natively. You may simulate a stack by using a list or deque (double-ended queue), as long as you use only standard operations of a stack.
You may assume that all operations are valid (for example, no pop or peek operations will be called on an empty queue).
*/

class MyQueue {

    /** Initialize your data structure here. */
    var inStack = [Int]()
    var outStack = [Int]()
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
       inStack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        peek()
        return outStack.popLast()!
    }
    
    /** Get the front element. */
    func peek() -> Int {
       if outStack.isEmpty {
           while !inStack.isEmpty {
               outStack.append(inStack.removeLast())
           }
          
       }
         return outStack[outStack.count - 1]
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return inStack.isEmpty && outStack.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
