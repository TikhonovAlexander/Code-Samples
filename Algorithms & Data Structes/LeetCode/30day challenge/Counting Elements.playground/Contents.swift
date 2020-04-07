import UIKit

// Given an integer array arr, count element x such that x + 1 is also in arr.

// If there're duplicates in arr, count them seperately.

//

//func countElements(_ arr: [Int]) -> Int {
//    var dict: [Int: Int] = [:]
//    var counter = 0
//    for element in arr {
//        dict[element, default: 0] += 1
//    }
//    for element in arr {
//        if let value = dict[element + 1], value > 0 {
//            dict[element + 1] = value - 1
//            counter += 1
//        }
//    }
//    return counter
//}

func countElements(_ arr: [Int]) -> Int {
    var set: Set<Int> = []
    var counter = 0
    for element in arr {
        set.insert(element)
    }
    for element in arr {
        if set.contains(element + 1) {
            counter += 1
        }
    }
    return counter
}

countElements([1,2,3])
countElements([1,1,3,3,5,5,7,7])
countElements([1,3,2,3,5,0])
countElements([1,1,2,2])
countElements([1,1,2])
