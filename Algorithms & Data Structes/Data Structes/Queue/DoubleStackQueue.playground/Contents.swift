import UIKit

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public struct DoubleStackQueue<T>: Queue {
    
    private var leftStack = [T]()
    private var rightStack = [T]()
    public init() {}
    
    mutating public func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    mutating public func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
    
    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        leftStack.isEmpty ? rightStack.first : leftStack.last
    }
}

extension DoubleStackQueue: CustomStringConvertible {
    public var description: String {
        String(describing: leftStack.reversed() + rightStack)
    }
}

var queue = DoubleStackQueue<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue
queue.dequeue()
queue
queue.peek
