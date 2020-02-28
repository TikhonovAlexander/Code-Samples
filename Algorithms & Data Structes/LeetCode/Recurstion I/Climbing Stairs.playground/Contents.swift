import UIKit

// You are climbing a stair case. It takes n steps to reach to the top.
// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
//Note: Given n will be a positive integer.


class Solution {
    
    var memo = [0:0, 1:1, 2:2]
    
    func climbStairs(_ n: Int) -> Int {
        if let value = memo[n] {
            return value
        }
        memo[n] = climbStairs(n - 1) + climbStairs(n - 2)
        return memo[n]!
        
    }
}

Solution().climbStairs(2) // 2
Solution().climbStairs(3) // 3
Solution().climbStairs(4) // 5
Solution().climbStairs(5) // 8
