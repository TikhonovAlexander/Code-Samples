import UIKit

// Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum

// Input: [-2,1,-3,4,-1,2,1,-5,4],
// Output: 6
// Explanation: [4,-1,2,1] has the largest sum = 6.

func maxSubArray(_ nums: [Int]) -> Int {
    
    guard !nums.isEmpty else { return 0 }
    
    var i = 1
    var sum = nums.first!
    var maxSum = nums.first!
    
    while i != nums.count  {
        let v = max(sum + nums[i], nums[i])
        maxSum = max(maxSum, v)
        sum = v
        i += 1
    }
    
    return maxSum
}

maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
maxSubArray([])
maxSubArray([1])
maxSubArray([1,2])
maxSubArray([1,2,3])
maxSubArray([1,2,-500])
maxSubArray([-2,1])
maxSubArray([-1,0,-2])
