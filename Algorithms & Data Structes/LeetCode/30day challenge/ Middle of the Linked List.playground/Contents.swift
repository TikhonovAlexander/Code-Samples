import UIKit

// Given a non-empty, singly linked list with head node head, return a middle node of linked list.

// If there are two middle nodes, return the second middle node.

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func middleNode(_ head: ListNode?) -> ListNode? {
    
    var slow: ListNode? = head
    var fast: ListNode? = head
    
    while fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return slow
}

middleNode(nil)?.val
let n1 = ListNode(1)
middleNode(n1)?.val
let n2 = ListNode(2)
n1.next = n2
middleNode(n1)?.val
let n3 = ListNode(3)
n2.next = n3
middleNode(n1)?.val
let n4 = ListNode(4)
n3.next = n4
middleNode(n1)?.val
let n5 = ListNode(5)
n4.next = n5
middleNode(n1)?.val
