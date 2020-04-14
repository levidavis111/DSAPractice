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
        guard root != nil else {return nil}
        
        var stack = Stack<TreeNode>()
        var currentNode: TreeNode? = nil
        var head: TreeNode? = nil
        var temp: TreeNode? = root
        
        while temp != nil {
            stack.push(temp!)
            temp = temp?.left
        }
        
        while !stack.isEmpty {
            var temp2 = stack.pop()
            if head == nil {
                head = TreeNode(temp2!.val)
                currentNode = head
            } else {
                currentNode?.right = TreeNode(temp2!.val)
                currentNode = currentNode?.right
            }
            if temp2?.right != nil {
                stack.push(temp2!.right!)
                temp2 = temp2?.right
                while temp2?.left != nil {
                    stack.push(temp2!.left!)
                    temp2 = temp2?.left
                }
            }
               
            }
            return head
        }
}
