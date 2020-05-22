/*
Write a function to find the 2nd largest element in a binary search tree.

Gotchas
Our first thought might be to do an in-order traversal of the BST and return the second-to-last item. This means looking at every node in the BST. That would take O(n) time and O(h) space, where h is the max height of the tree (which is lg(n) if the tree is balanced, but could be as much as n if not).

We can do better than O(n) time and O(h) space.

We can do this in one walk from top to bottom of our BST. This means O(h) time (again, that's O(lg(n)) if the tree is balanced, O(n) otherwise).

A clean recursive implementation will take O(h) space in the call stack, but we can bring our algorithm down to O(1) space overall.
*/
enum BinaryTreeSearchError: Error, CustomStringConvertible {
    case lessThanTwoNodes

    var description: String {
        return "Tree must have at least 2 nodes"
    }
}

class BinaryTreeNode {

    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    init(_ value: Int) {
        self.value = value
    }

    @discardableResult
    func insert(leftValue: Int) -> BinaryTreeNode {
        left = BinaryTreeNode(leftValue)
        return left!
    }

    @discardableResult
    func insert(rightValue: Int) -> BinaryTreeNode {
        right = BinaryTreeNode(rightValue)
        return right!
    }
}

func findLargestValue(startingFrom node: BinaryTreeNode) -> Int {
    var current = node
    
    while let right = current.right {
        current = right
    }
    
    return current.value
}

func findSecondLargestValue(startingFrom node: BinaryTreeNode) throws -> Int {
    guard node.left != nil || node.right != nil else {throw BinaryTreeSearchError.lessThanTwoNodes}
    
    var current = node
    
    while true {
        if let left = current.left {
            if current.right == nil {
                return findLargestValue(startingFrom: left)
            }
        }
        
        if let right = current.right {
            if right.right == nil &&
                right.left == nil {
                    return current.value
                }
            current = right
        }
        
    }
    
}
