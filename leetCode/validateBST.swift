/*
98. Validate Binary Search Tree

Given a binary tree, determine if it is a valid binary search tree (BST).

Assume a BST is defined as follows:

The left subtree of a node contains only nodes with keys less than the node's key.
The right subtree of a node contains only nodes with keys greater than the node's key.
Both the left and right subtrees must also be binary search trees
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

struct NodeBounds {
    let node: TreeNode
    var val: Int {
        return node.val
    }
    let lower: Int
    let upper: Int
    
    init(_ node: TreeNode, lower: Int, upper: Int) {
        self.node = node; self.lower = lower; self.upper = upper
    }
}

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else {return true}
        var stack = [NodeBounds]()
        let rootNB = NodeBounds(root, lower: Int.min, upper: Int.max)
        stack.append(rootNB)
        
        while !stack.isEmpty {
            let nb = stack.removeLast()
            let node = nb.node
            let val = nb.val
            let lower = nb.lower
            let upper = nb.upper
            
            if val <= lower || val >= upper {
                return false
            }
            
            if let left = node.left {
                let leftNB = NodeBounds(left, lower: lower, upper: val)
                stack.append(leftNB)
            }
            
            if let right = node.right {
                let rightNB = NodeBounds(right, lower: val, upper: upper)
                stack.append(rightNB)
            }
        }
        
        
        return true
    }
}
