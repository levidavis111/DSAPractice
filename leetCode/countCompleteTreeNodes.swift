/*
222. Count Complete Tree Nodes

Given a complete binary tree, count the number of nodes.

Note:

Definition of a complete binary tree from Wikipedia:
In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

Example:

Input: 
    1
   / \
  2   3
 / \  /
4  5 6

Output: 6
*/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else {return 0}
        
        var stack = [TreeNode]()
        stack.append(root)
        var count = 0
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            count += 1
            
            if let left = node.left {
                stack.append(left)
            }
            
            if let right = node.right {
                stack.append(right)
            }
        }
        
        return count
    }
}
