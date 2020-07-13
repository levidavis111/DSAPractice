/*
404. Sum of Left Leaves

Find the sum of all left leaves in a given binary tree.

Example:

    3
   / \
  9  20
    /  \
   15   7

There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.
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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard let root = root else {return 0}
        var queue = [TreeNode]()
        queue.append(root)
        var sum = 0
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            if let left = current.left {
                if left.left == nil && left.right == nil {
                    sum += left.val
                } else {
                    queue.append(left)
                }
            }
            
            if let right = current.right {
                queue.append(right)
            }
        }
        
        return sum
    }
}
