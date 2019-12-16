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
list.append(value: 4)
list.append(value: 10)
list.append(value: 11)

let list2 = LinkedList<Int>(head: nil)
list2.append(value: 1)
list2.append(value: 2)
list2.append(value: 3)
list2.append(value: 6)

// Create a function that takes two sorted linked lists and merges them into a single sorted linked list. Your goal is to return a new linked list that contains the nodes from two lists in sorted order. You may assume the sort order is ascending. For example:
// // list1
// 1 -> 4 -> 10 -> 11
// // list2
// -1 -> 2 -> 3 -> 6
// // merged list
// -1 -> 1 -> 2 -> 3 -> 4 -> 6 -> 10 -> 11

func merge(list1: LinkedList<Int>, list2: LinkedList<Int>) -> LinkedList<Int> {
    
    var next1 = list1.head
    var next2 = list2.head
    
    let list = LinkedList<Int>(head: nil)
    
    while next1 != nil || next2 != nil {
        guard let _ = next1 else {
            list.append(value: next2!.value)
            next2 = next2?.next
            continue
        }
        guard let _ = next2 else {
            list.append(value: next1!.value)
            next1 = next1?.next
            continue
        }
        if next1!.value <= next2!.value {
            list.append(value: next1!.value)
            next1 = next1?.next
        } else {
            list.append(value: next2!.value)
            next2 = next2?.next
        }
    }
    
    return list
    
}

print(list)
print(list2)
print(merge(list1: list, list2: list2))
