import UIKit

var array: [[Int]] = []

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    array = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)
    return uniquePaths2(m - 1, n - 1)
}

func uniquePaths2(_ i: Int, _ j: Int) -> Int {

    if i == 0, j == 0 { return 1 }

    guard array[i][j] == -1 else { return array[i][j] }

    var res1 = 0
    var res2 = 0

    if i > 0 {
        res1 = uniquePaths2(i - 1, j)
    }

    if j > 0 {
        res2 = uniquePaths2(i, j - 1)
    }

    let result = res1 + res2
    array[i][j] = result

    return result
}


uniquePaths(23, 12)
