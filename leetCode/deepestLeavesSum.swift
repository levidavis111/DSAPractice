/*
1302. Deepest Leaves Sum

Given the root of a binary tree, return the sum of values of its deepest leaves.

Example 1:


Input: root = [1,2,3,4,5,null,6,7,null,null,null,null,8]
Output: 15
Example 2:

Input: root = [6,7,8,2,7,1,3,9,null,1,4,null,null,null,5]
Output: 19
 

Constraints:

The number of nodes in the tree is in the range [1, 104].
1 <= Node.val <= 100
*/
//SLOW, but it works:

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
struct NodeDepth {
    let node: TreeNode
    let depth: Int
    var val: Int {
        return node.val
    }
}

class Solution {
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let root = root else {return 0}
        let rootND = NodeDepth(node: root, depth: 1)
        var leaves = [NodeDepth]()
        var stack = [NodeDepth]()
        stack.append(rootND)
        var sum = 0
        
        while !stack.isEmpty {
            let currentND = stack.removeLast()
            let node = currentND.node
            let depth = currentND.depth
            
            if node.left == nil && node.right == nil {
                leaves.append(currentND)
            } else {
                if let left = node.left {
                    let nd = NodeDepth(node: left, depth: depth + 1)
                    stack.append(nd)
                }
                
                if let right = node.right {
                    let nd = NodeDepth(node: right, depth: depth + 1)
                    stack.append(nd)
                }
            }
        }
        
        let sortedleaves = leaves.sorted(by: {$0.depth < $1.depth})
        let deepest = sortedleaves[sortedleaves.count - 1].depth
        
        let filtered = sortedleaves.filter{$0.depth == deepest}
        filtered.forEach {
            sum += $0.val
        }
        
        return sum
    }
}
//Slightly faster using binary search:

struct NodeDepth {
    let node: TreeNode
    let depth: Int
    var val: Int {
        return node.val
    }
}

class Solution {
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let root = root else {return 0}
        let rootND = NodeDepth(node: root, depth: 1)
        var leaves = [NodeDepth]()
        var stack = [NodeDepth]()
        stack.append(rootND)
        var sum = 0
        
        while !stack.isEmpty {
            let currentND = stack.removeLast()
            let node = currentND.node
            let depth = currentND.depth
            
            if node.left == nil && node.right == nil {
                insertInPlace(currentND, &leaves)
            } else {
                if let left = node.left {
                    let nd = NodeDepth(node: left, depth: depth + 1)
                    stack.append(nd)
                }
                
                if let right = node.right {
                    let nd = NodeDepth(node: right, depth: depth + 1)
                    stack.append(nd)
                }
            }
        }
        
        // let sortedLeaves = leaves.sorted(by: {$0.depth < $1.depth})
        let deepest = leaves[leaves.count - 1].depth
        leaves.forEach {
            if $0.depth == deepest {
                sum += $0.val
            }
        }
        
        return sum
    }
    
    private func insertInPlace(_ node: NodeDepth, _ arr: inout [NodeDepth]) {
        guard arr.count > 0 else {arr.append(node); return}
        
        var left = 0
        var right = arr.count - 1
        
        while left <= right {
            let middle = (left + right) / 2
            let currentNode = arr[middle]
            let depthVal = currentNode.depth
            
            if node.depth == depthVal {
                arr.insert(node, at: middle)
                return
            } else if node.depth > depthVal {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        arr.insert(node, at: left)
    }
}
