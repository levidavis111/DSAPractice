/*
Given a binary search tree, rearrange the tree in in-order so that the leftmost node in the tree is now the root of the tree, and every node has no left child and only 1 right child.

Example 1:
Input: [5,3,6,2,4,null,8,1,null,null,null,7,9]

       5
      / \
    3    6
   / \    \
  2   4    8
 /        / \ 
1        7   9

Output: [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]

 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
            \
             7
              \
               8
                \
                 9  
*/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

struct Stack<T> {
    var arr = [T]()
    var isEmpty: Bool {
        return arr.isEmpty
    }
    
    mutating func push(_ element: T) {
        arr.append(element)
    }
    
    mutating func pop() -> T? {
        return arr.popLast()
    }
    
    func peek() -> T? {
        return arr[arr.count - 1]
    }
}

class Solution {
   func increasingBST(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {return nil}
        if root.right == nil && root.left == nil {
            return root
        }
        
        var stack = Stack<TreeNode>()
        var newRoot: TreeNode? = nil
        var current: TreeNode? = root
  
        while current != nil {
            stack.push(current!)
            current = current?.left
        }
            
        current = nil
       
        while !stack.isEmpty {
            guard var temp = stack.pop() else {return newRoot}
            
            if newRoot == nil {
                newRoot = TreeNode(temp.val)
                current = newRoot
            } else {
                current?.right = TreeNode(temp.val)
                current = current?.right
            }
            
            if let right = temp.right {
                stack.push(right)
                temp = right
                
                while temp.left != nil {
                    if let left = temp.left {
                        stack.push(left)
                        temp = left
                    }
                }
            }
            
        }
            
       
        return newRoot
    }
}
