/*
559. Maximum Depth of N-ary Tree

Given a n-ary tree, find its maximum depth.

The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).
*/
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */
class NodeDepth {
    let node: Node
    let depth: Int
    
    init(_ node: Node, _ depth: Int) {
        self.node = node; self.depth = depth
    }
}
class Solution {
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else {return 0}
        let rootND = NodeDepth(root, 1)
        var stack = [NodeDepth]()
        stack.append(rootND)
        var output: Int = 1
       
        while !stack.isEmpty {
            let current = stack.removeLast()
            let node = current.node
            let depth = current.depth
            let children = node.children
            output = max(output, depth)
            
            if children.count > 0 {
                for child in children {
                    let nd = NodeDepth (child, depth + 1)
                    stack.append(nd)
                }
            }
        }
        return output
    }
}
