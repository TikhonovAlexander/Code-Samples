import UIKit

// Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.

// get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
// put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.

// The cache is initialized with a positive capacity.

// O(1) doubly list

class LRUCache {
    
    typealias Value = (value: Int, date: Date)
    
    var dict: [Int: Value] = [:]
    var capacity: Int = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let a = dict[key] {
            dict[key] = (a.value, Date())
        }
        return dict[key]?.value ?? -1
        
    }
    
    func put(_ key: Int, _ value: Int) {
        if let _ = dict[key] {
            dict[key] = (value, Date())
        } else {
            if dict.keys.count == capacity {
                let oldKey = dict.min { (lhs, rhs) -> Bool in
                    return lhs.value.date < rhs.value.date
                }
                dict.removeValue(forKey: oldKey!.key)
            }
            dict[key] = (value, Date())
        }
    }
}


// Your LRUCache object will be instantiated and called as such:
let obj = LRUCache(2)
obj.get(2)
obj.put(2, 6)
obj.get(1)
obj.put(1, 5)
obj.put(1, 2)
obj.get(1)
obj.get(2)
