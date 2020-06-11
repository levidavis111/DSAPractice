/*
155. Min Stack

Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

push(x) -- Push element x onto stack.
pop() -- Removes the element on top of the stack.
top() -- Get the top element.
getMin() -- Retrieve the minimum element in the stack.
 

Example 1:

Input
["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]

Output
[null,null,null,null,-3,null,0,-2]

Explanation
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin(); // return -3
minStack.pop();
minStack.top();    // return 0
minStack.getMin(); // return -2
 

Constraints:

Methods pop, top and getMin operations will always be called on non-empty stacks.
*/
class MinStack {
    
    var arr = [Int]()
    var minStack = [Int]()
    
    func push(_ x: Int) {
       if arr.isEmpty {
           minStack.append(x)
       } else {
           let peek = minStack[minStack.count - 1]
           if x <= peek {
               minStack.append(x)
           }
       }
        arr.append(x)
    }
    
    func pop() {
        guard !arr.isEmpty else {return}
        let remove = arr.removeLast()
        let peek = minStack[minStack.count - 1]
        if remove == peek {minStack.removeLast()}
        
    }
    
    func top() -> Int {
       return arr[arr.count - 1]
    }
    
    func getMin() -> Int {        
        return minStack[minStack.count - 1]
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
