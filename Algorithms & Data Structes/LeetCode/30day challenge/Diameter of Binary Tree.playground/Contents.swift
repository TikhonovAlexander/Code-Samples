import UIKit

// Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

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

func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    var result: Int = 0
    diameterOfBinaryTree(root, result: &result)
    return result
}

func diameterOfBinaryTree(_ root: TreeNode?, result: inout Int) -> Int {
    
    guard let root = root else {
        return 0
    }
    let leftLength = diameterOfBinaryTree(root.left, result: &result)
    let rightLength = diameterOfBinaryTree(root.right, result: &result)
    
    let length = leftLength + rightLength
    result = max(result, length)
    
    return max(leftLength, rightLength) + 1
}

let n1 = TreeNode(1)
let n2 = TreeNode(2)
let n3 = TreeNode(3)
let n4 = TreeNode(4)
let n5 = TreeNode(5)
let n6 = TreeNode(6)
let n7 = TreeNode(7)
let n8 = TreeNode(8)
let n9 = TreeNode(9)
let n10 = TreeNode(10)
let n11 = TreeNode(11)
let n12 = TreeNode(12)
let n13 = TreeNode(13)
let n14 = TreeNode(14)
let n15 = TreeNode(15)
let n16 = TreeNode(16)
let n17 = TreeNode(17)
let n18 = TreeNode(18)
let n19 = TreeNode(19)
let n20 = TreeNode(20)


n1.left = n2
n2.left = n3
n2.right = n4
n4.left = n5
n4.right = n6
n1.right = n7
n7.right = n8
n8.left = n10
n8.right = n9
n10.left = n13
n10.right = n14
n13.left = n15
n13.right = n16
n15.left = n19
n15.right = n20
n9.left = n11
n9.right = n12
n11.left = n17
n11.right = n18

diameterOfBinaryTree(n1)
