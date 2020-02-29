import UIKit


// Definition for a binary tree node.
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
    
    private func maxDepth(_ root: TreeNode?, currentDepth: Int) -> Int {
        guard let root = root else { return 0 }
        let leftDepth = maxDepth(root.left, currentDepth: currentDepth)
        let rightDepth = maxDepth(root.right, currentDepth: currentDepth)
        return max(leftDepth, rightDepth) + 1
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        return maxDepth(root, currentDepth: 0)
    }
}

let n1 = TreeNode(3)
let n2 = TreeNode(9)
let n3 = TreeNode(20)
let n4 = TreeNode(15)
let n5 = TreeNode(7)

n1.left = n2
n1.right = n3
n3.left = n4
n3.right = n4

Solution().maxDepth(n1)
Solution().maxDepth(n3)
Solution().maxDepth(n5)
