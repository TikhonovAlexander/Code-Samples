import UIKit

// Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

func productExceptSelf(_ nums: [Int]) -> [Int] {
    var result = [Int](repeating: 1, count: nums.count)
    
    var l = 1
    for i in 0..<nums.count{
        result[i] = l
        l = nums[i] * l
    }
    var r = 1
    for i in (0..<nums.count).reversed() {
        result[i] *= r
        r = nums[i] * r
    }
    
    return result
}


productExceptSelf([1,2,3,4])
//productExceptSelf([1,2])
//productExceptSelf([1,1])
//productExceptSelf([0,0])
//productExceptSelf([44,2,3,4])
//productExceptSelf([1, -1, 1, 1, -1, 1, -1, -1, -1 , 1, 1, 1, -1])
