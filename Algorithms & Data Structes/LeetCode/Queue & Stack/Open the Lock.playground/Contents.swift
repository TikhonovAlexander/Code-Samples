import UIKit

// You have a lock in front of you with 4 circular wheels. Each wheel has 10 slots: '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'. The wheels can rotate freely and wrap around: for example we can turn '9' to be '0', or '0' to be '9'. Each move consists of turning one wheel one slot.

// The lock initially starts at '0000', a string representing the state of the 4 wheels.

// You are given a list of deadends dead ends, meaning if the lock displays any of these codes, the wheels of the lock will stop turning and you will be unable to open it.

// Given a target representing the value of the wheels that will unlock the lock, return the minimum total number of turns required to open the lock, or -1 if it is impossible.

func openLock(_ deadends: [String], _ target: String) -> Int {
    var cache: Set<[Int]> = []
    var queue: [[Int]] = []
    
    let current = [0, 0, 0, 0]
    let deads: Set<[Int]> = Set(deadends.map { $0.map { Int(String($0))! } })
    let target: [Int] = target.map { Int(String($0))! }
    var counter = 0
    queue.append(current)
    cache.insert(current)
    guard !deads.contains(target) else { return -1 }
    var temp = [Int]()
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            
            let str = queue.removeFirst()
            
            if deads.contains(str) {
                continue
            }
            
            if str == target {
                return counter
            }
            
            for i in 0...3 {
                for d in stride(from: -1, through: 1, by: 2) {
                    temp = str
                    temp[i] = (10 + temp[i] + d) % 10
                    if !deads.contains(temp) && !cache.contains(temp) {
                        queue.append(temp)
                        cache.insert(temp)
                    }
                }
            }
            
        }
        counter += 1
    }
    
    return -1
}


openLock(["0201","0101","0102","1212","2002"], "0202")
openLock(["8888"], "0009")
openLock(["8887","8889","8878","8898","8788","8988","7888","9888"], "8888")
openLock(["0000"], "8888")

