import UIKit


// Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.

// Note that the row index starts from 0.

// 0      1
// 1     1 1
// 2    1 2 1
// 3   1 3 3 1
// 4  1 4 6 4 1

// Could you optimize your algorithm to use only O(k) extra space?

// [1, 0, 0 , 0, 0]
// [1, 1, 0 , 0, 0]
// [1, 2, 1 , 0, 0]

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var array = [Int](repeating: 0, count: rowIndex + 1)
        array[0] = 1
        for _ in 0..<rowIndex {
            for j in stride(from: array.count - 1, through: 1, by: -1) {
                array[j] = array[j] + array[j - 1]
            }
        }
        return array
    }
}

Solution().getRow(1)
Solution().getRow(2)
Solution().getRow(3)
Solution().getRow(4)
Solution().getRow(5)
Solution().getRow(32)

