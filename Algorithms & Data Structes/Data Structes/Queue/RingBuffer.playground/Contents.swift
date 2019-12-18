import UIKit

public struct RingBuffer<T> {

    private var array: [T?]
    private var readIndex: Int = 0
    private var writeIndex: Int = 0
    
    init(count: Int) {
        array = [T?](repeating: nil, count: count)
    }
    
    private var availableSpaceForWriting: Int {
        array.count - availableSpaceForReading
    }
    
    private var availableSpaceForReading: Int {
        writeIndex - readIndex
    }
    
    var isEmpty: Bool {
        availableSpaceForReading == 0
    }
    
    var isFull: Bool {
        availableSpaceForWriting == 0
    }
    
    mutating func read() -> T? {
        guard !isEmpty else { return nil }
        let value = array[readIndex % array.count]
        readIndex += 1
        return value
    }
    
    mutating func write(_ value: T) -> Bool {
        guard !isFull else { return false }
        array[writeIndex % array.count] = value
        writeIndex += 1
        return true
    }
    
}

var buffer = RingBuffer<Int>(count: 5)

buffer.write(123)
buffer.write(456)
buffer.write(789)
buffer.write(666)

buffer.read()   // 123
buffer.read()   // 456
buffer.read()   // 789

buffer.write(333)
buffer.write(555)

buffer.read()   // 666
buffer.read()   // 333
buffer.read()   // 555
buffer.read()   // nil
