/*
Given a binary tree, find its minimum depth.

The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

Note: A leaf is a node with no children.

Example:

Given binary tree [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
return its minimum depth = 2.
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
cclass Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard root != nil else {return 0}
        
        let left = minDepth(root?.left)
        let right = minDepth(root?.right)
        
        if left == 0 {
            return right + 1
        } else if right == 0 {
            return left + 1
        } else {
            return min(left, right) + 1
        }
    }
}
