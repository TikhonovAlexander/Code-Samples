import UIKit


class MinStack {

    var array: [(Int, Int)] = []
    
    init() {}
    
    func push(_ x: Int) {
        let m = min(array.last?.1 ?? x, x)
        array.append( (x, m))
    }
    
    func pop() {
        array.removeLast()
    }
    
    func top() -> Int {
        return array.last?.0 ?? 0
    }
    
    func getMin() -> Int {
        return array.last?.1 ?? 0
    }
}


let obj = MinStack()
obj.push(-2)
obj.push(0)
obj.push(-3)
obj.getMin()
obj.pop()
obj.getMin()
obj.top()
obj.getMin()

