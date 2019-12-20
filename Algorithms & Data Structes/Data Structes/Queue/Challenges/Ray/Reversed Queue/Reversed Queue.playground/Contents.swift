import UIKit

extension Queue {
    func reversed() -> Self {
        var queue = self
        var stack = Stack<Element>()
        while let element = queue.dequeue() {
            stack.push(element)
        }
        while let element = stack.pop() {
            queue.enqueue(element)
        }
        return queue
    }
}


var queue = ArrayQueue<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")

queue
queue.reversed()
