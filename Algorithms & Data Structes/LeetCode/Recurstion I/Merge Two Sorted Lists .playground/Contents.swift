import UIKit


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

// Input: 1->2->4, 1->3->4
// Output: 1->1->2->3->4->4
class Solution {
    func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else {
            return l2
        }
        guard let l2 = l2 else {
            return l1
        }
        if l1.val <= l2.val {
            l1.next = mergeTwoLists2(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists2(l1, l2.next)
            return l2
        }
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return mergeTwoLists2(l1, l2)
    }
}

func pr(_ root: ListNode?) {
    var root = root
    while let next = root  {
        print(next.val, terminator: " ")
        root = root?.next
    }
    print("")
}

let l1 = ListNode(1)
let l2 = ListNode(2)
let l3 = ListNode(4)
let l4 = ListNode(1)
let l5 = ListNode(3)
let l6 = ListNode(4)

l1.next = l2
l2.next = l3
l4.next = l5
l5.next = l6

let result = Solution().mergeTwoLists(l1, l4)
pr(l1)
pr(l4)
pr(result)
