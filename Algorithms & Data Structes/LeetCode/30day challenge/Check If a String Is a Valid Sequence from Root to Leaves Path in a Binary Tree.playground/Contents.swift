import UIKit

// Given a binary tree where each path going from the root to any leaf form a valid sequence, check if a given string is a valid sequence in such binary tree.

// We get the given string from the concatenation of an array of integers arr and the concatenation of all values of the nodes along a path results in a sequence in the given binary tree.

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
 
class Solution {
    func isValidSequence(_ root: TreeNode?, _ arr: [Int]) -> Bool {
        
        guard let root = root else { return false }
        guard let first = arr.first else { return false }

        if root.left == nil && root.right == nil && root.val == first && arr.count == 1 {
            return true
        }
        
        if root.val == first {
            let newArr = Array(arr.dropFirst())
            let a = isValidSequence(root.left, newArr)
            let b = isValidSequence(root.right, newArr)
            return a || b
        }
        
        return false
    }
}

