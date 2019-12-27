import UIKit

public struct TreeNode<T> {
    var value: T
    var children: [TreeNode] = []
    public init(value: T) {
        self.value = value
    }
    public mutating func append(_ child: TreeNode) {
        children.append(child)
    }
}

// traversal
extension TreeNode {
    func depthFirstTraversal(visit: (TreeNode) -> Void ) {
        visit(self)
        children.forEach {
            $0.depthFirstTraversal(visit: visit)
        }
    }
    func eachLevelTraversal(visit: (TreeNode) -> Void ) {
        visit(self)
        var queue = ArrayQueue<TreeNode>()
        children.forEach { _ = queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { _ = queue.enqueue($0) }
        }
    }
}

var node1 = TreeNode(value: 15)
var node2 = TreeNode(value: 1)
var node3 = TreeNode(value: 17)
var node4 = TreeNode(value: 20)
var node5 = TreeNode(value: 9)
var node6 = TreeNode(value: 5)
var node7 = TreeNode(value: 0)
var node8 = TreeNode(value: 2)
var node9 = TreeNode(value: 5)
var node10 = TreeNode(value: 7)
node4.append(node10)
node4.append(node9)
node3.append(node8)
node2.append(node7)
node2.append(node6)
node2.append(node5)
node1.append(node4)
node1.append(node3)
node1.append(node2)

func printEachLevel<T>(root: TreeNode<T>) {
    var queue = ArrayQueue<TreeNode<T>>()
    queue.enqueue(root)
    var countCurrentLevel = 0
    while !queue.isEmpty {
        
        countCurrentLevel = queue.count
        
        while countCurrentLevel > 0 {
            guard let node = queue.dequeue() else { break }
            print("\(node.value) ", terminator: "")
            node.children.forEach { _ = queue.enqueue($0) }
            countCurrentLevel -= 1
        }
        print()
    }
}

printEachLevel(root: node1)

