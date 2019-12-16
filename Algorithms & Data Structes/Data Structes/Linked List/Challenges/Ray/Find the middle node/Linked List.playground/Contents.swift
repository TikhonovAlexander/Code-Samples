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

// 1 -> 2 -> 3 -> 4 -> nil // middle is 3
// 1 -> 2 -> 3 -> nil // middle is 2

let list = LinkedList<Int>(head: nil)
list.append(value: 1)
list.append(value: 2)
list.append(value: 3)
list.append(value: 4)

let list2 = LinkedList<Int>(head: nil)
list2.append(value: 1)
list2.append(value: 2)
list2.append(value: 3)

let list3 = LinkedList<Int>(head: nil)
list3.append(value: 1)

func findMiddle(list: LinkedList<Int>) -> Int? {
    guard !list.isEmpty else { return nil }
    var size = 0
    var next = list.head
    while next != nil {
        next = next?.next
        size += 1
    }
    let middle = size / 2
    next = list.head
    var i = 0
    while i != middle {
        next = next?.next
        i += 1
    }
    return next?.value
}
print(list)
findMiddle(list: list)
findMiddle(list: list2)
findMiddle(list: list3)
findMiddle(list: LinkedList<Int>(head: nil))

func findMiddle2(list: LinkedList<Int>) -> Int? {
    var slow = list.head
    var fast = list.head
    
    while fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return slow?.value
}

findMiddle2(list: list)
findMiddle2(list: list2)
findMiddle2(list: list3)
findMiddle2(list: LinkedList<Int>(head: nil))
