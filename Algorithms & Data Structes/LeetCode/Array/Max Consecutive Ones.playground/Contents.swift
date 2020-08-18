import UIKit
import XCTest

// Given a binary array, find the maximum number of consecutive 1s in this array.
// Input: [1,1,0,1,1,1]
// Output: 3
// Explanation: The first two digits or the last three digits are consecutive 1s. The maximum number of consecutive 1s is 3.
func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var result = 0
    var counter = 0
    for n in nums {
        if n == 0 {
            result = max(result, counter)
            counter = 0
        } else {
            counter += 1
        }
    }
    result = max(result, counter)
    return result
}


XCTAssertEqual(findMaxConsecutiveOnes([1]), 1)
XCTAssertEqual(findMaxConsecutiveOnes([0]), 0)
XCTAssertEqual(findMaxConsecutiveOnes([1,1]), 2)
XCTAssertEqual(findMaxConsecutiveOnes([0,1]), 1)
XCTAssertEqual(findMaxConsecutiveOnes([1,1,0,1,1,1]), 3)
