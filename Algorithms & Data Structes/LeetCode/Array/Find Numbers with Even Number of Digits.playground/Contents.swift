import UIKit
import XCTest

// Given an array nums of integers, return how many of them contain an even number of digits.

// Input: nums = [12,345,2,6,7896]
// Output: 2
// Explanation:
// 12 contains 2 digits (even number of digits).
// 345 contains 3 digits (odd number of digits).
// 2 contains 1 digit (odd number of digits).
// 6 contains 1 digit (odd number of digits).
// 7896 contains 4 digits (even number of digits).
// Therefore only 12 and 7896 contain an even number of digits.

func findNumbers(_ nums: [Int]) -> Int {
    var result = 0
    var nums = nums

    for _ in 1...3 {

        for i in 0..<nums.count {
            if nums[i] >= 10 && nums[i] <= 99 {
                result += 1
            }
            nums[i] /= 100
        }

    }

    return result
}

XCTAssertEqual(findNumbers([12,345,2,6,7896]), 2)
XCTAssertEqual(findNumbers([555,901,482,1771]), 1)
XCTAssertEqual(findNumbers([12,345,2,26,55]), 3)
XCTAssertEqual(findNumbers([1,345,2,6]), 0)
XCTAssertEqual(findNumbers([]), 0)
XCTAssertEqual(findNumbers([9999, 33, 2, 22, 100000]), 4)
