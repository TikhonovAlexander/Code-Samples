import UIKit

// Given a binary tree, return the inorder traversal of its nodes' values.

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    inorderTraversalRecursive(root, result: &result)
    return result
}
func inorderTraversalRecursive(_ root: TreeNode?, result: inout [Int]) {
    guard let root = root else { return }
    inorderTraversalRecursive(root.left, result: &result)
    result.append(root.val)
    inorderTraversalRecursive(root.right, result: &result)
}

func inorderTraversalIterative(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    var result = [Int]()
    var stack: [TreeNode] = []
    var current: TreeNode? = root
    while !stack.isEmpty || current != nil {
        if current != nil {
            stack.append(current!)
            current = current!.left
        } else {
            current = stack.removeLast()
            result.append(current!.val)
            current = current?.right
        }
    }
    return result
}

let n1 = TreeNode(1)
let n2 = TreeNode(2)
let n3 = TreeNode(3)
n1.right = n2
n2.left = n3

inorderTraversal(n1)
inorderTraversalIterative(n1)
