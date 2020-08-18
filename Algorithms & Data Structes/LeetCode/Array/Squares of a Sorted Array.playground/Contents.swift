import UIKit
import XCTest

// Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.
// Input: [-4,-1,0,3,10]
// Output: [0,1,9,16,100]

func sortedSquares(_ A: [Int]) -> [Int] {
    var B = A
    var i = 0
    var j = A.count - 1
    var N = A.count - 1

    while N >= 0 {
        if abs(A[i]) > abs(A[j]) {
            B[N] = A[i] * A[i]
            i += 1
        } else {
            B[N] = A[j] * A[j]
            j -= 1
        }
        N -= 1
        print(i, j, N)
        print(B)
    }

    return B
}

XCTAssertEqual(sortedSquares([-4,-1,0,3,10]), [0,1,9,16,100])


// 101 = 1 + 4 = 5
// 1010 = 2 + 8 = 10
// 10100 = 4 + 16 = 20
