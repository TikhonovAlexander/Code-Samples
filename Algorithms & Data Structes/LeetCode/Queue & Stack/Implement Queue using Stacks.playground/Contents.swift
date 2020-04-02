import UIKit

// Implement the following operations of a queue using stacks.

// push(x) -- Push element x to the back of queue.
// pop() -- Removes the element from in front of queue.
// peek() -- Get the front element.
// empty() -- Return whether the queue is empty.

// You must use only standard operations of a stack -- which means only push to top, peek/pop from top, size, and is empty operations are valid.
// Depending on your language, stack may not be supported natively. You may simulate a stack by using a list or deque (double-ended queue), as long as you use only standard operations of a stack.
// You may assume that all operations are valid (for example, no pop or peek operations will be called on an empty queue).

class MyQueue {

    var stack1: Stack<Int> = []
    var stack2: Stack<Int> = []
    
    /** Initialize your data structure here. */
    init() { }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        stack1.push(value: x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if !stack2.isEmpty {
            return stack2.pop()!
        }
        while let element = stack1.pop() {
            stack2.push(value: element)
        }
        return stack2.pop()!
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if !stack2.isEmpty {
            return stack2.peek!
        }
        while let element = stack1.pop() {
            stack2.push(value: element)
        }
        return stack2.peek!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stack1.isEmpty && stack2.isEmpty
    }
}

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

// Your MyQueue object will be instantiated and called as such:
let obj = MyQueue()
obj.push(1)
obj.push(2)
obj.push(3)
obj.push(4)
let ret_2: Int = obj.pop()
let ret_3: Int = obj.peek()
let ret_4: Bool = obj.empty()
obj.pop()
obj.push(5)
obj.pop()
obj.pop()
obj.pop()
obj.empty()

