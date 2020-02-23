import UIKit

// Given a linked list, swap every two adjacent nodes and return its head.

// You may not modify the values in the list's nodes, only nodes itself may be changed.

// Given 1->2->3->4, you should return the list as 2->1->4->3.


// Definition for singly-linked list.

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    
    func swapNode(head: ListNode?, next: ListNode?, prev: ListNode?) {
        guard head != nil, next != nil else { return }
        let nextHead = next?.next
        prev?.next = next
        next?.next = head
        head?.next = nextHead
        swapNode(head: nextHead, next: nextHead?.next, prev: head)
    }
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if let next = head?.next {
            swapNode(head: head, next: next, prev: nil)
            return next
        }
        return head
    }
    
    func prints(_ head: ListNode?) {
        var next = head
        while let node = next {
            print(node.val, terminator: " ")
            next = next?.next
        }
        print(" ")
    }
}

let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
node1.next = node2
node2.next = node3
node3.next = node4

let solution = Solution()
solution.prints(node1)

let result = solution.swapPairs(node1)
solution.prints(result)
