import Foundation

public struct RingBuffer<T> {

    private var array: [T?]
    private var readIndex: Int = 0
    private var writeIndex: Int = 0
    
    public init(count: Int) {
        array = [T?](repeating: nil, count: count)
    }
    
    public var first: T? {
        guard !isEmpty else { return nil }
        return array[readIndex % array.count]
    }
    
    private var availableSpaceForWriting: Int {
        array.count - availableSpaceForReading
    }
    
    private var availableSpaceForReading: Int {
        writeIndex - readIndex
    }
    
    public var isEmpty: Bool {
        availableSpaceForReading == 0
    }
    
    public var isFull: Bool {
        availableSpaceForWriting == 0
    }
    
    public mutating func read() -> T? {
        guard !isEmpty else { return nil }
        let value = array[readIndex % array.count]
        readIndex += 1
        return value
    }
    
    public mutating func write(_ value: T) -> Bool {
        guard !isFull else { return false }
        array[writeIndex % array.count] = value
        writeIndex += 1
        return true
    }
    
}
