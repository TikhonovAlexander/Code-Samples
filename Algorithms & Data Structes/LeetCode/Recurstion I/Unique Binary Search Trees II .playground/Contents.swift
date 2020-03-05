import UIKit

// Given an integer n, generate all structurally unique BST's (binary search trees) that store values 1 ... n.
//
// Example:
//
// Input: 3
// Output:
// [
//   [1,null,3,2],
//   [3,2,null,1],
//   [3,1,null,null,2],
//   [2,1,3],
//   [1,null,2,null,3]
// ]
// Explanation:
// The above output corresponds to the 5 unique BST's shown below:
//
//    1         3     3      2      1
//     \       /     /      / \      \
//      3     2     1      1   3      2
//     /     /       \                 \
//    2     1         2                 3


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
    
    func pr() {
        left?.pr()
        print(val)
        right?.pr()
    }
}

// [1, 2, 3, 4, 5, 6]
class Solution {
    
    func generateTrees(set: Set<Int> ) -> [TreeNode?] {
        
        guard !set.isEmpty else { return [] }
        if set.count == 1 { return [TreeNode(set.first!)]}
        
        var result: [TreeNode?] = []
        
        for element in set {
            
            let mins = set.filter { $0 < element }
            let maxs = set.filter { $0 > element }
            
            let gMins = generateTrees(set: mins)
            let gMaxs = generateTrees(set: maxs)
            
        
            for r in gMins {
                let node = TreeNode(element)
                node.left = r
                result.append(node)
            }

            for r in gMaxs {
                let node = TreeNode(element)
                node.right = r
                result.append(node)
            }
 
        }
        return result
    }
    
    func generateTrees(_ n: Int) -> [TreeNode?] {
        var set: Set<Int> = []
        for i in 1...n {
            set.insert(i)
        }
        return generateTrees(set: set)
    }
}


let a = Solution().generateTrees(3)
for w in a {
    w?.pr()
}
