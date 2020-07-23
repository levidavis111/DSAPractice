/*
590. N-ary Tree Postorder Traversal

Given an n-ary tree, return the postorder traversal of its nodes' values.

Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).

Follow up:

Recursive solution is trivial, could you do it iteratively?

Example 1:

Input: root = [1,null,3,2,4,null,5,6]
Output: [5,6,3,2,4,1]
Example 2:

Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
Output: [2,6,14,11,7,3,12,8,4,13,9,10,5,1]
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
    func postorder(_ root: Node?) -> [Int] {
        guard let root = root else {return []}
        var stack = [(Node, Bool)]()
        stack.append((root, false))
        var output = [Int]()
        
        while !stack.isEmpty {
            let (current, isVisited) = stack.removeLast()
            let children = current.children
            
            if children.isEmpty || isVisited {
                output.append(current.val)
            } else {
                stack.append((current, true))
                children.reversed().map{stack.append(($0, false))}
            }
            
        }
        
        return output
    }
}
//Recurrsive
class Solution {
    func postorder(_ root: Node?) -> [Int] {
        guard let root = root else {return []}
        var output = [Int]()
        
        for child in root.children {
            output += postorder(child)
        }
        
        return output + [root.val]
    }
}
