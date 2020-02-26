import UIKit

// Reverse a singly linked list.

// Input: 1->2->3->4->5->NULL
// Output: 5->4->3->2->1->NULL

// A linked list can be reversed either iteratively or recursively. Could you implement both?


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }
        var previous = head
        var next = head?.next
        previous?.next = nil
        
        var temp: ListNode?
        while next != nil {
            temp = next?.next
            next?.next = previous
            previous = next
            next = temp
        }
        
        return previous
    }
    
    func reverseListRecursively(_ head: ListNode?) -> ListNode? {
        func reverse(_ previous: ListNode?, next: ListNode?) -> ListNode? {
            guard next != nil else { return previous }
            let temp = next?.next
            next?.next = previous
            return reverse(next, next: temp)
        }
        return reverse(nil, next: head)
    }
    
}

func pr(_ head: ListNode?) {
    var next = head
    while next != nil {
        print(next!.val, terminator: " ")
        next = next?.next
    }
    print()
}

let n1 = ListNode(1)
let n2 = ListNode(2)
let n3 = ListNode(3)
let n4 = ListNode(4)
n1.next = n2
n2.next = n3
n3.next = n4

let solution = Solution()
pr(n1)
let new = solution.reverseList(n1)
pr(new)

let newR = solution.reverseListRecursively(new)
pr(newR)
