import UIKit


// Given the root node of a binary search tree (BST) and a value. You need to find the node in the BST that the node's value equals the given value. Return the subtree rooted with that node. If such node doesn't exist, you should return NULL.

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

class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val == val {
            return root
        }
        if root.val > val {
            return searchBST(root.left, val)
        } else {
            return searchBST(root.right, val)
        }
    }
}

let node1 = TreeNode(4)
let node2 = TreeNode(2)
let node3 = TreeNode(7)
let node4 = TreeNode(1)
let node5 = TreeNode(3)
node1.left = node2
node1.right = node3
node2.left = node4
node2.right = node5

Solution().searchBST(node1, 4)?.val
Solution().searchBST(node1, 2)?.val
Solution().searchBST(node1, 7)?.val
Solution().searchBST(node1, 3)?.val
Solution().searchBST(node1, 9)?.val


