import UIKit

class MyStack {

    var queue1: [Int] = []
    var queue2: [Int] = []
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        queue1.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        let size1 = queue1.count
        var i = 1
        while i != size1 {
            let val = queue1.removeFirst()
            queue2.append(val)
            i += 1
        }
        let result = queue1.removeFirst()
        while !queue2.isEmpty {
            let el = queue2.removeFirst()
            queue1.append(el)
        }
        return result
    }
    
    /** Get the top element. */
    func top() -> Int {
        let size1 = queue1.count
        var i = 1
        while i != size1 {
            let val = queue1.removeFirst()
            queue2.append(val)
            i += 1
        }
        
        let result = queue1.removeFirst()
        queue2.append(result)
        
        while !queue2.isEmpty {
            let el = queue2.removeFirst()
            queue1.append(el)
        }
        return result
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return queue1.isEmpty && queue2.isEmpty
    }
}


let obj = MyStack()
obj.push(1)
obj.push(2)

obj.top()
obj.pop()
obj.empty()

