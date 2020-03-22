import UIKit

// Given a reference of a node in a connected undirected graph.

// Return a deep copy (clone) of the graph.

public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

var cache: Set<Int> = []
var array: [Node?] = []

func findNode(val: Int) -> Node? {
    let index = array.firstIndex { node -> Bool in
        guard let node = node else {
            return false
        }
        return node.val == val
    }
    return index == nil ? nil : array[index!]
}

func cloneGraph(_ node: Node?) -> Node? {
    guard let node = node else { return nil }
    let newNode = Node(node.val)
    cache.insert(newNode.val)
    array.append(newNode)
    var neighbors: [Node?] = []
    for neighbor in node.neighbors {
        if let n = neighbor {
            if !cache.contains(n.val) {
                let newNeighbor = cloneGraph(n)
                neighbors.append(newNeighbor)
            } else {
                neighbors.append(findNode(val: n.val))
            }
        } else {
            neighbors.append(nil)
        }
    }
    newNode.neighbors = neighbors
    return newNode
}
