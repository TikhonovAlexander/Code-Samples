import UIKit


public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public struct RingBufferQueue<T>: Queue {
    
    private var ringBuffer: RingBuffer<T>
    public init(count: Int) {
        ringBuffer = RingBuffer(count: count)
    }
    
    mutating public func enqueue(_ element: T) -> Bool {
        return ringBuffer.write(element)
    }
    mutating public func dequeue() -> T? {
        ringBuffer.read()
    }
    
    public var isEmpty: Bool {
        ringBuffer.isEmpty
    }
    
    public var peek: T? {
        ringBuffer.first
    }
}

extension RingBufferQueue: CustomStringConvertible {
    public var description: String {
        String(describing: ringBuffer)
    }
}

var queue = RingBufferQueue<String>(count: 5)
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue
queue.dequeue()
queue
queue.peek
