import UIKit

// Given a non-empty binary tree, find the maximum path sum.

// For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.

 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }

func maxPathSum(_ root: TreeNode?) -> Int {
    var result: Int = .min
    maxPathSum(root, result: &result)
    return result
}

func maxPathSum(_ root: TreeNode?, result: inout Int) -> Int {
    
    guard let root = root else {
        return 0
    }
    let leftSum = maxPathSum(root.left, result: &result)
    let rightSum = maxPathSum(root.right, result: &result)
    
    let maxSum = max(leftSum, rightSum)
    let leftRightSum = leftSum + rightSum
    let sum1 = root.val + maxSum
    let sum2 = root.val + leftRightSum
    let m = max(sum1, sum2, root.val)
    result = max(result, m)
    return max(sum1, root.val)
}

let n1 = TreeNode(-9)
let n2 = TreeNode(2)
let n3 = TreeNode(-3)

n1.left = n2
n1.right = n3

maxPathSum(n1)

