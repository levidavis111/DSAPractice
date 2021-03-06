/*
589. N-ary Tree Preorder Traversal

Given an n-ary tree, return the preorder traversal of its nodes' values.

Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).

Follow up:

Recursive solution is trivial, could you do it iteratively?

Example 1:

Input: root = [1,null,3,2,4,null,5,6]
Output: [1,3,5,6,2,4]
Example 2:

Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
Output: [1,2,3,6,7,11,14,4,8,12,5,9,13,10]
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
//Iterative

class Solution {
    func preorder(_ root: Node?) -> [Int] {
    	guard let root = root else {return []}
        
        var stack = [Node]()
        stack.append(root)
        var output = [Int]()
        
        while !stack.isEmpty {
            let current = stack.removeLast()
            let children = current.children
            output.append(current.val)
            children.reversed().map{stack.append($0)}
        }
        return output
    }
}
//Recurrsive
class Solution {
    func preorder(_ root: Node?) -> [Int] {
    	guard let root = root else {return []}
        var output = [Int]()
        
        output.append(root.val)
        
        for child in root.children {
            output += preorder(child)
        }
        
        return output
    }
}
