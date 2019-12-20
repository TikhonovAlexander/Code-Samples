import Foundation

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public struct ArrayQueue<T>: Queue {
    
    private var array: [T] = []
    public init() {}
    
    mutating public func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    mutating public func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var peek: T? {
        array.first
    }
}

extension ArrayQueue: CustomStringConvertible {
    public var description: String {
        String(describing: array)
    }
}
