/*
104. Maximum Depth of Binary Tree

Given a binary tree, find its maximum depth.

The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

Note: A leaf is a node with no children.

Example:

Given binary tree [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
return its depth = 3.
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

struct NodeDepthPair {
    var node: TreeNode
    var depth: Int
}

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {return 0}
        var maxDepth = 0
        let rootND = NodeDepthPair(node: root, depth: 1)
        var stack = [rootND]
        
        while !stack.isEmpty {
            let nd = stack.removeLast()
            let node = nd.node
            let depth = nd.depth
            
            if node.left == nil && node.right == nil {
                maxDepth = max(maxDepth, depth)
            }
            
            if let left = node.left {
                let nd = NodeDepthPair(node: left, depth: depth + 1)
                stack.append(nd)
            }
            
            if let right = node.right {
                let nd = NodeDepthPair(node: right, depth: depth + 1)
                stack.append(nd)
            }
        }
        return maxDepth
    }
}
