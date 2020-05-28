/*
Write a function to check that a binary tree is a valid binary search tree.

Consider this example:

A binary tree. To the left of the root is a subtree with a node containing 30, its left child containing 20, and its right child (highlighted in blue) 60.
Notice that when you check the blue node against its parent, it seems correct. However, it's greater than the root, so it should be in the root's right subtree. So we see that checking a node against its parent isn't sufficient to prove that it's in the correct spot.

We can do this in O(n) time and O(n) additional space, where n is the number of nodes in our tree. Our additional space is O(lgn) if our tree is balanced.
*/
class BinaryTreeNode {

    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    init(_ value: Int) {
        self.value = value
    }

    @discardableResult
    func insert(leftValue: Int) -> BinaryTreeNode {
        let left = BinaryTreeNode(leftValue)
        self.left = left
        return left
    }

    @discardableResult
    func insert(rightValue: Int) -> BinaryTreeNode {
        let right = BinaryTreeNode(rightValue)
        self.right = right
        return right
    }
}

struct NodeBounds {
    let node: BinaryTreeNode
    var value: Int {
        return node.value
    }
    let lower: Int
    let upper: Int
}


func isBinarySearchTree(_ tree: BinaryTreeNode) -> Bool {
    
    let rootNB = NodeBounds(node: tree, lower: Int.min, upper: Int.max)
    var stack = [NodeBounds]()
    stack.append(rootNB)
    
    while !stack.isEmpty {
        let nb = stack.removeLast()
        let node = nb.node
        let value = nb.value
        let lower = nb.lower
        let upper = nb.upper
        
        if value <= lower || value >= upper {
            return false
        }
        
        if let left = node.left {
            let nb = NodeBounds(node: left, lower: lower, upper: value)
            stack.append(nb)
        }
        
        if let right = node.right {
            let nb = NodeBounds(node: right, lower: value, upper: upper)
            stack.append(nb)
        }
    }
    
    return true
}
