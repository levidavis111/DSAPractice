/*
129. Sum Root to Leaf Numbers

Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.

An example is the root-to-leaf path 1->2->3 which represents the number 123.

Find the total sum of all root-to-leaf numbers.

Note: A leaf is a node with no children.

Example:

Input: [1,2,3]
    1
   / \
  2   3
Output: 25
Explanation:
The root-to-leaf path 1->2 represents the number 12.
The root-to-leaf path 1->3 represents the number 13.
Therefore, sum = 12 + 13 = 25.
Example 2:

Input: [4,9,0,5,1]
    4
   / \
  9   0
 / \
5   1
Output: 1026
Explanation:
The root-to-leaf path 4->9->5 represents the number 495.
The root-to-leaf path 4->9->1 represents the number 491.
The root-to-leaf path 4->0 represents the number 40.
Therefore, sum = 495 + 491 + 40 = 1026.
*/

//Iterative:
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

class NodeSum {
    let node: TreeNode
    let sum: Int
    var val: Int {
        return node.val
    }
    
    init(_ node: TreeNode, _ sum : Int) {
        self.node = node; self.sum = sum
    }
}

class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let root = root else {return 0}
        let rootNS = NodeSum(root, root.val)
        var stack = [rootNS]
        var output = 0
        
        while !stack.isEmpty {
            let ns = stack.removeLast()
            let node = ns.node
            let sum = ns.sum
            let val = ns.val
            
            if node.left == nil && node.right == nil {
                output += sum
            }
            
            if let left = node.left {
                let ns = NodeSum(left, sum * 10 + left.val)
                stack.append(ns)
            }
            
            if let right = node.right {
                let ns = NodeSum(right, sum * 10 + right.val)
                stack.append(ns)
            }
        }
        
        
        return output
    }
    
}

//Recursive:
class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        return helperFunc(root, 0)
    }
    
    private func helperFunc(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else {return 0}
        
        var sum = sum * 10 + root.val
        
        if root.left == nil && root.right == nil {return sum}
        
        return helperFunc(root.left, sum) + helperFunc(root.right, sum)
    }
}
