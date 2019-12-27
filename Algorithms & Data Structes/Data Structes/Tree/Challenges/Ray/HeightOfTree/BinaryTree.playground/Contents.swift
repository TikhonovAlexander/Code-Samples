import UIKit

public class BinaryNode<T> {
    var value: T
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    public init(value: T) {
        self.value = value
    }
}

// traversal
extension BinaryNode {
    func height() -> Int {
        let leftHeight = leftChild?.height() ?? -1
        let rightHeight = rightChild?.height() ?? -1
        return max(leftHeight, rightHeight) + 1
    }
}

var tree: BinaryNode<Int> = {
    let zero = BinaryNode(value: 0)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let seven = BinaryNode(value: 7)
    let eight = BinaryNode(value: 8)
    let nine = BinaryNode(value: 9)
    let ten = BinaryNode(value: 10)
    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    seven.rightChild = nine
    nine.leftChild = eight
    eight.rightChild = ten
    return seven
}()

tree.height()
