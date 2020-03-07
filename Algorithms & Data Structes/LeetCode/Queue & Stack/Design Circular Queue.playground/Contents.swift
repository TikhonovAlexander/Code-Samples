import UIKit

var str = "Hello, playground"

class MyCircularQueue {

    private var queue: [Int]
    private var pushIndex: Int
    private var popIndex: Int
    
    var size: Int {
        return queue.count
    }
    
    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
        queue = Array(repeating: 0, count: k)
        pushIndex = -1
        popIndex = -1
    }
    
    /** Insert an element into the circular queue. Return true if the operation is successful. */
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else { return false }
        pushIndex += 1
        queue[pushIndex % size] = value
        return true
    }
    
    /** Delete an element from the circular queue. Return true if the operation is successful. */
    func deQueue() -> Bool {
        guard !isEmpty() else { return false }
        popIndex += 1
        return true
    }
    
    /** Get the front item from the queue. */
    func Front() -> Int {
        guard !isEmpty() else {
            return -1
        }
        return queue[(popIndex + 1) % size]
    }
    
    /** Get the last item from the queue. */
    func Rear() -> Int {
        guard !isEmpty() else {
            return -1
        }
        return queue[pushIndex % size]
    }
    
    /** Checks whether the circular queue is empty or not. */
    func isEmpty() -> Bool {
        return pushIndex == popIndex
    }
    
    /** Checks whether the circular queue is full or not. */
    func isFull() -> Bool {
        return pushIndex - popIndex == size
    }
}


// Your MyCircularQueue object will be instantiated and called as such:

let k = 3

let circularQueue =  MyCircularQueue(3); // set the size to be 3
circularQueue.Front()
circularQueue.Rear()
circularQueue.isEmpty()
circularQueue.isFull()
circularQueue.deQueue()
circularQueue.enQueue(1);
circularQueue.enQueue(2);
circularQueue.enQueue(3);
circularQueue.isFull()
