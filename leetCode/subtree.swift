/*
572. Subtree of Another Tree

Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's descendants. The tree s could also be considered as a subtree of itself.

Example 1:
Given tree s:

     3
    / \
   4   5
  / \
 1   2
Given tree t:
   4 
  / \
 1   2
Return true, because t has the same structure and node values with a subtree of s.
 

Example 2:
Given tree s:

     3
    / \
   4   5
  / \
 1   2
    /
   0
Given tree t:
   4
  / \
 1   2
Return false.
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
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        guard s != nil && t != nil else {return false}
        
        if s?.val == t?.val {
            if isSameTree(s, t) {
                return true
            }
        }
        return isSubtree(s?.left, t) || isSubtree(s?.right, t)
    }
    
    func isSameTree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        guard s != nil && t != nil else {return s?.val == t?.val}
        guard s?.val == t?.val else {return false}
        
        return isSameTree(s?.right, t?.right) && isSameTree(s?.left, t?.left)
    }
}
