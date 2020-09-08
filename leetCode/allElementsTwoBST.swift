/*
1305. All Elements in Two Binary Search Trees

Given two binary search trees root1 and root2.

Return a list containing all the integers from both trees sorted in ascending order.

Example 1:


Input: root1 = [2,1,4], root2 = [1,0,3]
Output: [0,1,1,2,3,4]
Example 2:

Input: root1 = [0,-10,10], root2 = [5,1,7,0,2]
Output: [-10,0,0,1,2,5,7,10]
Example 3:

Input: root1 = [], root2 = [5,1,7,0,2]
Output: [0,1,2,5,7]
Example 4:

Input: root1 = [0,-10,10], root2 = []
Output: [-10,0,10]
Example 5:


Input: root1 = [1,null,8], root2 = [8,1]
Output: [1,1,8,8]
 

Constraints:

Each tree has at most 5000 nodes.
Each node's value is between [-10^5, 10^5].
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
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        let array1 = getElements(root1)
        let array2 = getElements(root2)
        var output = array1 + array2
        output = output.sorted()
        
        return output
    }
    
    func getElements(_ root: TreeNode?) -> [Int] {
        guard let root = root else {return []}
        
        var output = [Int]()
        var stack = [TreeNode]()
        stack.append(root)
        
        while !stack.isEmpty {
            let current = stack.removeLast()
            output.append(current.val)
            
            if let left = current.left {
                stack.append(left)
            }
            
            if let right = current.right {
                stack.append(right)
            }
        }
        
        return output
    }
}
//Faster using stack and binary search:
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
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var output = [Int]()
        var stack = [TreeNode]()
        if let root1 = root1 {stack.append(root1)}
        if let root2 = root2 {stack.append(root2)}
        
        while !stack.isEmpty {
            let current = stack.removeLast()
            
            putInSortedPlace(current.val, &output)
            
            if let left = current.left {
                stack.append(left)
            }
            
            if let right = current.right {
                stack.append(right)
            }
        }
        
        return output
    }
    
    func putInSortedPlace(_ num: Int, _ arr: inout [Int]) {
        guard arr.count > 0 else {arr.append(num); return}
        var left = 0
        var right = arr.count - 1
        
        while left <= right {
            let middle = (left + right) / 2
            let currentNum = arr[middle]
            
            if num == currentNum {
                arr.insert(num, at: middle)
                return
            } else if num < currentNum {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        arr.insert(num, at: left)
    }
}
