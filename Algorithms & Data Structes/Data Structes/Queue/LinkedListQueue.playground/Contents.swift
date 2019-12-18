import UIKit

var str = "Hello, playground"

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public struct LinkedListQueue<T>: Queue {
    
    private var list = DoublyLinkedList<T>()
    public init() {}
    
    mutating public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }
    mutating public func dequeue() -> T? {
        guard !isEmpty, let element = list.first else { return nil }
        return list.remove(element)
    }
    
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    public var peek: T? {
        list.first?.value
    }
}

extension LinkedListQueue: CustomStringConvertible {
    public var description: String {
        String(describing: list)
    }
}

var queue = LinkedListQueue<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue
queue.dequeue()
queue
queue.peek
