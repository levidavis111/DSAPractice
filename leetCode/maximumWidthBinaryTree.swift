/*
662. Maximum Width of Binary Tree

Given a binary tree, write a function to get the maximum width of the given tree. The width of a tree is the maximum width among all levels. The binary tree has the same structure as a full binary tree, but some nodes are null.

The width of one level is defined as the length between the end-nodes (the leftmost and right most non-null nodes in the level, where the null nodes between the end-nodes are also counted into the length calculation.

Example 1:

Input: 

           1
         /   \
        3     2
       / \     \  
      5   3     9 

Output: 4
Explanation: The maximum width existing in the third level with the length 4 (5,3,null,9).
Example 2:

Input: 

          1
         /  
        3    
       / \       
      5   3     

Output: 2
Explanation: The maximum width existing in the third level with the length 2 (5,3).
Example 3:

Input: 

          1
         / \
        3   2 
       /        
      5      

Output: 2
Explanation: The maximum width existing in the second level with the length 2 (3,2).
Example 4:

Input: 

          1
         / \
        3   2
       /     \  
      5       9 
     /         \
    6           7
Output: 8
Explanation:The maximum width existing in the fourth level with the length 8 (6,null,null,null,null,null,null,7).
*/

//I'm still fuzzy on how the math works to determine the node position value
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

class NodeVal {
    let node: TreeNode
    let val: Int
    
    init(_ node: TreeNode, _ val: Int) {
        self.node = node
        self.val = val
    }
}
class Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else {return 0}
        let rootNV = NodeVal(root, 0)
        var queue = [NodeVal]()
        queue.append(rootNV)
        var maxWidth = 1
        
        while !queue.isEmpty {
            guard let first = queue.first else {return 0}
            guard let last = queue.last else {return 0}
            let diff = last.val - first.val + 1
            maxWidth = max(maxWidth, diff)
            
            for _ in 0..<queue.count {
                let currentNV = queue.removeFirst()
                let node = currentNV.node
                let val = currentNV.val
                if let left = node.left {
                    let nv = NodeVal(left, (val * 2) - 1)
                    queue.append(nv)
                }
                if let right = node.right {
                    let nv = NodeVal(right, val * 2)
                    queue.append(nv)
                }
            }
            
        }
        return maxWidth
    }
}
