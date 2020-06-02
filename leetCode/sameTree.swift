/*
100. Same Tree

Given two binary trees, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard p != nil || q != nil else {return true}
        
        var pStack = [TreeNode]()
        if let p = p {
            pStack.append(p)
        }
        var qStack = [TreeNode]()
        if let q = q {
            qStack.append(q)
        }
        
        while !pStack.isEmpty && !qStack.isEmpty {
            let p = pStack.removeLast()
            let q = qStack.removeLast()
            
            if p.val != q.val {return false}
            if (p.left == nil && q.left != nil) || (p.right == nil && q.right != nil) || (p.left != nil && q.left == nil) || (p.right != nil && q.right == nil) {return false}
            
            if let leftP = p.left {
                pStack.append(leftP)
            }
            
            if let rightP = p.right {
                pStack.append(rightP)
            }
            
            if let leftQ = q.left {
                qStack.append(leftQ)
            }
            
            if let rightQ = q.right {
                qStack.append(rightQ)
            }
            
        }
        
        return pStack.isEmpty && qStack.isEmpty
    }
}
