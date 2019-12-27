import UIKit

extension BinaryNode {

    public func traversePreOrder2(visit: (Element?) -> Void) {
        visit(value)
        if let left = leftChild {
            left.traversePreOrder2(visit: visit)
        } else {
            visit(nil)
        }
        if let right = rightChild {
            right.traversePreOrder2(visit: visit)
        } else {
            visit(nil)
        }
    }
    
}

func serialization<T>(root: BinaryNode<T>) -> [T?] {
    var result: [T?] = []
    root.traversePreOrder2 { value in
        result.append(value)
    }
    return result
}

private func deserialize<T>(array: inout [T?]) -> BinaryNode<T>? {
    var newArray = Array(array.reversed())
    return deserialization(array: &newArray)
}

private func deserialization<T>(array: inout [T?]) -> BinaryNode<T>? {
    guard !array.isEmpty, let value = array.removeLast() else { return nil }
    let node = BinaryNode<T>(value: value)
    node.leftChild = deserialization(array: &array)
    node.rightChild = deserialization(array: &array)
    return node
}
