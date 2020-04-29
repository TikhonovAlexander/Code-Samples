import UIKit

// also possible to solve this task using double list
class FirstUnique {
    
    var queue: [Int] = []
    var dict: [Int: Int] = [:]
    var index = 0
    
    init(_ nums: [Int]) {
        nums.forEach { self.add($0) }
    }
    
    func showFirstUnique() -> Int {
        return queue.isEmpty ? -1 : queue.first!
    }
    
    func add(_ value: Int) {
        dict[value, default: 0] += 1
        if dict[value]! == 1 {
            queue.append(value)
        } else {
            while !queue.isEmpty {
                if let c = dict[queue.first!], c > 1 {
                    queue.removeFirst()
                    continue
                } else {
                    break
                }
            }
            
        }
    }
}

let obj = FirstUnique([2,3,5])
obj.showFirstUnique()
obj.add(5)
obj.showFirstUnique()
obj.add(2)
obj.showFirstUnique()
obj.add(3)
obj.showFirstUnique()

let obj2 = FirstUnique([7,7,7,7,7,7])
obj2.showFirstUnique()
obj2.add(7)
obj2.add(3)
obj2.add(3)
obj2.add(7)
obj2.add(17)
obj2.showFirstUnique()
