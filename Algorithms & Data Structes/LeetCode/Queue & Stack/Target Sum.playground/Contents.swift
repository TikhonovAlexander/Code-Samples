import UIKit

// You are given a list of non-negative integers, a1, a2, ..., an, and a target, S. Now you have 2 symbols + and -. For each integer, you should choose one from + and - as its new symbol.

// Find out how many ways to assign symbols to make sum of integers equal to target S.

//
//                [5, 4, 3, 2, 1]
// Input: nums is [1, 1, 1, 1, 1], S is 3.
// Output: 5

func DFS(_ nums: [Int], sums: [Int], _ target: Int, _ pos: Int, _ result: inout Int) {
    if pos == nums.count {
        if target == 0 {
            result += 1
        }
        return
    }
    
    if sums[pos] < abs(target) {
        return
    }
    
    
    DFS(nums, sums: sums, target + nums[pos], pos + 1, &result)
    DFS(nums, sums: sums, target - nums[pos], pos + 1, &result)

}
func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
    var result: Int = 0
    
    var sums: [Int] = [Int](repeating: 0, count: nums.count)
    sums[sums.count - 1] = nums[nums.count - 1]
    for i in stride(from: nums.count - 2, through: 0, by: -1) {
        sums[i] = sums[i + 1] + nums[i]
    }
    
    DFS(nums, sums: sums, S, 0, &result)
    
    return result
}

findTargetSumWays([1, 1, 1, 1, 1], 2)
findTargetSumWays([1, 1, 1, 1, 1], -5)
findTargetSumWays([1, 1, 1, 1, 1], 5)
