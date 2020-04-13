import UIKit

// Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1

// [ 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1]

func findMaxLength2(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return 0 }
    var dict: [Int : Int] = [0 : -1]
    var result = 0
    
    var sum: Int = 0
    
    for i in 0..<nums.count {
        sum += nums[i] == 0 ? -1 : 1
        if let j = dict[sum] {
            result = max(result, i - j)
        } else {
            dict[sum] = i
        }
    }
    
    return result
}

// brute force
func findMaxLength(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    
    let length = nums.count - 1
    var offset = 0
    
    var ones = 0
    var nulls = 0
    
    while offset != length {
        for t in 0...offset {
            ones = 0
            nulls = 0
            for i in t...(length - offset + t) {
                if nums[i] == 1 {
                    ones += 1
                } else {
                    nulls += 1
                }
            }
            if ones == nulls {
                return length + 1 - offset
            }
        }
        offset += 1
    }
    return 0
}

findMaxLength([0,1])
findMaxLength([0,1,0])
findMaxLength([0,1,0,0])
findMaxLength([0,1,0,1])
findMaxLength([ 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1])
findMaxLength([])
findMaxLength([0])
findMaxLength([1])
findMaxLength([1,1,1])
