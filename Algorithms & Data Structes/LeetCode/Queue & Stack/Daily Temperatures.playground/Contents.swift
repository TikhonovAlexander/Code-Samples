import UIKit

// Given a list of daily temperatures T, return a list such that, for each day in the input, tells you how many days you would have to wait until a warmer temperature. If there is no future day for which this is possible, put 0 instead.

// For example, given the list of temperatures T = [73, 74, 75, 71, 69, 72, 76, 73], your output should be [1, 1, 4, 2, 1, 1, 0, 0].

// Note: The length of temperatures will be in the range [1, 30000]. Each temperature will be an integer in the range [30, 100].

// [73, 74, 75, 71, 69, 72, 76, 73]
// [1,   1,  4,  2,  1,  1,  0,  0]

[75: [4, 7, 44, 231], 80: [33, 9900]]

func dailyTemperatures(_ T: [Int]) -> [Int] {
    var result: [Int] = [Int](repeating: 0, count: T.count)
    var i = T.count - 2
    var j = 0
    while i >= 0 {
        j = i + 1
        while j < T.count && T[i] >= T[j] && result[j] != 0 {
            j += result[j]
        }
        if T[i] < T[j] {
            result[i] = j - i
        }
        i -= 1
    }
    return result
}

dailyTemperatures([])
dailyTemperatures([44])
dailyTemperatures([44, 100])
dailyTemperatures([100, 44])
dailyTemperatures([22, 55, 33])
dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73])
