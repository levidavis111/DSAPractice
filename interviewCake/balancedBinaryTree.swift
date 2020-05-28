/*
Write a function to see if a binary tree is "superbalanced" (a new tree property we just made up).

A tree is "superbalanced" if the difference between the depths of any two leaf nodes is no greater than one.

Gotchas
Your first thought might be to write a recursive function, thinking, "the tree is balanced if the left subtree is balanced and the right subtree is balanced." This kind of approach works well for some other tree problems.

But this isn't quite true. Counterexample: suppose that from the root of our tree:

The left subtree only has leaves at depths 10 and 11.
The right subtree only has leaves at depths 11 and 12.
Both subtrees are balanced, but from the root we will have leaves at 3 different depths.

We could instead have our recursive function get the array of distinct leaf depths for each subtree. That could work fine. But let's come up with an iterative solution instead. It's usually better to use an iterative solution instead of a recursive one because it avoids stack overflow. ↴

We can do this in O(n)O(n) time and O(n)O(n) space.

What about a tree with only one leaf node? Does your function handle that case properly?
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

struct NodeDepthPair {
    let node: BinaryTreeNode
    let depth: Int
}

func isBalanced(treeRoot: BinaryTreeNode) -> Bool {
    var depths = [Int]()
    let rootND = NodeDepthPair(node: treeRoot, depth: 0)
    var stack = [NodeDepthPair]()
    stack.append(rootND)
    
    while !stack.isEmpty {
        let nd = stack.removeLast()
        let node = nd.node
        let depth = nd.depth
        
        if node.left == nil && node.right == nil {
            if !depths.contains(depth) {
                depths.append(depth)
                if depths.count > 2 || (depths.count == 2 && (abs(depths[0] - depths[1]) > 1)) {
                    return false
                }
            }
        }
        if let left = node.left {
            let nd = NodeDepthPair(node: left, depth: depth + 1)
            stack.append(nd)
        }
        
        if let right = node.right {
            let nd = NodeDepthPair(node: right, depth: depth + 1)
            stack.append(nd)
        }
    }
    
    return true
    
}
