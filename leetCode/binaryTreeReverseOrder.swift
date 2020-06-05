/*
107. Binary Tree Level Order Traversal II

Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).

For example:
Given binary tree [3,9,20,null,null,15,7],
    3
   / \
  9  20
    /  \
   15   7
return its bottom-up level order traversal as:
[
  [15,7],
  [9,20],
  [3]
]
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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {return [[Int]]()}
        var queue = [root]
        var output = [[Int]]()
        while !queue.isEmpty {
            var subArr = [Int]()
            for _ in 0..<queue.count {
                let current = queue.removeFirst()
                subArr.append(current.val)
                if let left = current.left {
                    queue.append(left)
                }
                
                if let right = current.right {
                    queue.append(right)
                }
                
            }
             output.insert(subArr, at: 0)
        }
        
        return output
    }
}
