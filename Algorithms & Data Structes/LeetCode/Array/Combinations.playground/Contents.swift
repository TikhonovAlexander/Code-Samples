import UIKit

// Print all possible combinations of r elements in a given array of size n
// https://www.geeksforgeeks.org/print-all-possible-combinations-of-r-elements-in-a-given-array-of-size-n/

// Given an array of size n, generate and print all possible combinations of r elements in array. For example, if input array is {1, 2, 3, 4} and r is 2, then output should be {1, 2}, {1, 3}, {1, 4}, {2, 3}, {2, 4} and {3, 4}.

// Fix elements and recursion
// doesn't handle duplicates
func combination(r: Int, array: [Int]) -> [[Int]] {
    var total: [[Int]] = []
    combination2(r: r, result: [], index: 0, array: array, total: &total)
    return total
}

func combination2(r: Int, result: [Int], index: Int, array: [Int], total: inout [[Int]]) {
    if result.count == r {
        total.append(result)
        return
    }

    for i in index..<array.count {
        let element = array[i]
        var result = result
        result.append(element)
        combination2(r: r, result: result, index: i + 1, array: array, total: &total)
    }
}

let a = combination(r: 4, array: [1,2,3,4,5])
print(a)

let b = combination(r: 2, array: [1,2,1])
print(b)

// handle duplicates
func combinationHD(r: Int, array: [Int]) -> [[Int]] {
    var total: [[Int]] = []
    let array = array.sorted()
    combinationHD2(r: r, result: [], index: 0, array: array, total: &total)
    return total
}
// [1, 1, 1, 2]
// [1, 2, 2, 2]
func combinationHD2(r: Int, result: [Int], index: Int, array: [Int], total: inout [[Int]]) {
    if result.count == r {
        total.append(result)
        return
    }
    var i = index
    while i != array.count  {
        let element = array[i]
        var result = result
        result.append(element)
        combinationHD2(r: r, result: result, index: i + 1, array: array, total: &total)
        while i + 1 < array.count, array[i] == array[i + 1] {
            i += 1
        }
        i += 1
    }
}

let a1 = combinationHD(r: 4, array: [1,2,3,4,5])
print(a1)

let b1 = combinationHD(r: 2, array: [1,2,1])
print(b1)
