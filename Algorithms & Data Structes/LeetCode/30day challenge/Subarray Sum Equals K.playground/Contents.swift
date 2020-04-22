import UIKit

// Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.

// [1, 2, 3, 4, 1, 6],  k = 5

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var result = 0
    var sum = 0
    var dict: [Int: Int] = [:]
    dict[0] = 1
    
    for n in nums {
        sum += n
        if let value = dict[sum - k] {
            result += value
        }
        dict[sum, default: 0] += 1
    }
    return result
}

subarraySum([1,1,1], 2)
subarraySum([1], 2)
subarraySum([2], 2)
subarraySum([2, 2], 2)
