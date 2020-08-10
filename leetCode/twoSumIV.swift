/*
653. Two Sum IV - Input is a BST

Given a Binary Search Tree and a target number, return true if there exist two elements in the BST such that their sum is equal to the given target.

Example 1:

Input: 
    5
   / \
  3   6
 / \   \
2   4   7

Target = 9

Output: True
 

Example 2:

Input: 
    5
   / \
  3   6
 / \   \
2   4   7

Target = 28

Output: False
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
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard let root = root else {return false}
        var list = [Int]()
        inOrder(root, &list)
        print(list)
        var left = 0
        var right = list.count - 1
        
        while left < right {
            let leftNum = list[left]
            let rightNum = list[right]
    
            if leftNum + rightNum == k {
                return true
            } else if leftNum + rightNum < k {
                left += 1
            } else {
                right -= 1
            }
        }
        return false
    }
    
    func inOrder(_ root: TreeNode?, _ list: inout [Int]) {
        guard let root = root else {return}
        
        inOrder(root.left, &list)
        list.append(root.val)
        inOrder(root.right, &list)
    }
}
