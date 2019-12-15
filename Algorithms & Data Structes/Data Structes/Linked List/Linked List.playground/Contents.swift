import UIKit

// A linked list is a collection of values arranged in a linear unidirectional sequence. A linked list has several theoretical advantages over contiguous storage options such as the Swift Array:
// • Constant time insertion and removal from the front of the list.
// • Reliable performance characteristics.

class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedList<T: Comparable> {
    
    var head: Node<T>?
    var tail: Node<T>?
    
    init(head: Node<T>?) { self.head = head }
    
    var isEmpty: Bool { return head == nil }
    
    func push(value: T) -> Node<T> {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
        return head!
    }
    
    func append(value: T) -> Node<T> {
        if isEmpty {
            return push(value: value)
        }
        tail?.next = Node(value: value)
        tail = tail?.next
        return tail!
    }
    
    func insert(value: T, after node: Node<T>) -> Node<T> {
        if node === tail {
            return append(value: value)
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    func pop() -> T? {
        guard !isEmpty else { return nil }
        let h = head
        head = head?.next
        if isEmpty {
            tail = nil
        }
        return h?.value
    }
    
    func removeLast() -> T? {
        guard !isEmpty else { return nil }
        guard head?.next != nil  else {
            return pop()
        }
        var next = head
        var prev = head
        while next?.next != nil {
            prev = next
            next = next?.next
        }
        prev?.next = nil
        tail = prev
        return next?.value
    }
    
    func remove(after node: Node<T>) -> T? {
        let value = node.next?.value
        if node.next === tail {
            tail = node
        }
        node.next = node.next?.next
        return value
    }
}

extension LinkedList: CustomStringConvertible where T: LosslessStringConvertible {
    var description: String {
        var result = ""
        var next = head
        while next != nil {
            var v: String = "nil"
            if let value = next?.value {
                v = String(value)
            }
            result.append(v)
            result.append(" -> ")
            next = next?.next
        }
        result.append("nil (end)")
        return result
    }
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
node1.next = node2
node2.next = node3
let list = LinkedList<Int>(head: node1)
list.insert(value: 99, after: node3)
print(list)

list.push(value: 0)
print(list)

let empty = LinkedList<Int>(head: nil)
print(empty)
empty.append(value: 11)
empty.push(value: 10)
empty.append(value: 12)
print(empty)

let empty2 = LinkedList<Int>(head: nil)
empty2.push(value: 900)
print(empty2)
empty2.pop()
print(empty2)
