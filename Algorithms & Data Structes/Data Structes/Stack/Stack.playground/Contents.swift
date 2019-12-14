import UIKit

// Key points
// • A stack is a LIFO, last-in first-out, data structure.
// • Despite being so simple, the stack is a key data structure for many problems.
// • The only two essential operations for the stack are the push method for adding elements and the pop method for removing elements.

struct Stack<T> {
    
    private var storage: [T] = []
    
    var peek: T? {
        storage.last
    }
    
    var isEmpty: Bool {
        storage.isEmpty
    }
    
    mutating func pop() -> T? {
        storage.popLast()
    }
    
    mutating func push(value: T) {
        storage.append(value)
    }
    
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: T...) {
        storage = elements
    }
}

extension Stack: CustomDebugStringConvertible {
    var debugDescription: String {
        storage.debugDescription
    }
}

var stack: Stack = [1.0, 2.0, 3.0, 4.0]
print(stack)
