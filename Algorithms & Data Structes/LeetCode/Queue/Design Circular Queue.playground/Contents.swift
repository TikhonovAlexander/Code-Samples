import UIKit

var str = "Hello, playground"

class MyCircularQueue {

    private var queue: [Int]
    private var pushIndex: Int
    private var popIndex: Int
    
    // [0, 0, 0, 0]
    // [1, 0, 0, 0]
    
    var size: Int {
        return queue.count
    }
    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
        queue = Array(repeating: 0, count: k)
        pushIndex = 0
        popIndex = 0
    }
    // [0, 0, 0]
    /** Insert an element into the circular queue. Return true if the operation is successful. */
    func enQueue(_ value: Int) -> Bool {
        guard pushIndex - popIndex < size else { return false }
        queue[pushIndex % size] = value
        pushIndex += 1
        return true
    }
    
    /** Delete an element from the circular queue. Return true if the operation is successful. */
    func deQueue() -> Bool {
        guard !isEmpty() else { return false }
        popIndex += 1
        if popIndex == pushIndex {
            popIndex = 0
            pushIndex = 0
        }
        return true
    }
    
    /** Get the front item from the queue. */
    func Front() -> Int {
        guard !isEmpty() else {
            return -1
        }
        return queue[popIndex % size]
    }
    
    /** Get the last item from the queue. */
    func Rear() -> Int {
        guard !isEmpty() else {
            return -1
        }
        return queue[pushIndex - 1 % size]
    }
    
    /** Checks whether the circular queue is empty or not. */
    func isEmpty() -> Bool {
        return pushIndex == popIndex
    }
    
    /** Checks whether the circular queue is full or not. */
    func isFull() -> Bool {
        return !isEmpty()
    }
}


// Your MyCircularQueue object will be instantiated and called as such:

let k = 3

let a = -1 % 3
let circularQueue =  MyCircularQueue(3); // set the size to be 3
circularQueue.enQueue(1);  // return true
circularQueue.Rear();  // return 3
circularQueue.Rear();  // return 3
circularQueue.Front()
circularQueue.deQueue();  // return true
circularQueue.deQueue();  // return true
circularQueue.Rear();
circularQueue.Front()
circularQueue.deQueue();  // return true
circularQueue.enQueue(2);  // return true
circularQueue.enQueue(3);  // return true
circularQueue.enQueue(4);  // return false, the queue is full
circularQueue.Rear();  // return 3
circularQueue.isFull();  // return true

circularQueue.enQueue(4);  // return true
circularQueue.Rear();  // return 4

