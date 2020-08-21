import UIKit

// Given a fixed length array arr of integers, duplicate each occurrence of zero, shifting the remaining elements to the right.

// Note that elements beyond the length of the original array are not written.

// Do the above modifications to the input array in place, do not return anything from your function.

// [ 1, 2, 0, 9, 0, 0]
// [ 1, 2, 0, 0, 9, 0, 0, 0, 0]

func duplicateZeros(_ arr: inout [Int]) {

    let length = arr.count
    var i = 0

    while i < length {
        if arr[i] == 0 {
            arr.insert(0, at: i)
            i += 1
        }
        i += 1
    }

    arr = Array(arr[0..<length])
}

let ex = [0, 0, 0, 0, 0,  0, 2, 3, 4, 5]
var res = ex
duplicateZeros(&res)

print(res)

