import UIKit

// Return the root node of a binary search tree that matches the given preorder traversal.

// (Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendant of node.right has a value > node.val.  Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)


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

func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
    guard !preorder.isEmpty else { return nil }
    let root = TreeNode(preorder[0])
    for i in 1..<preorder.count {
        
        var next: TreeNode? = root
        while next != nil  {
            if next!.val > preorder[i] {
                if next?.left == nil {
                    next?.left = TreeNode(preorder[i])
                    break
                } else {
                    next = next?.left
                }
            } else {
                if next?.right == nil {
                    next?.right = TreeNode(preorder[i])
                    break
                } else {
                    next = next?.right
                }
            }
        }
    }
    return root
}

func pr(root: TreeNode?) {
    guard let next = root else { return }
    print(next.val)
    pr(root: next.left)
    pr(root: next.right)
}

let root = bstFromPreorder([8,5,1,7,10,12])
pr(root: root)
