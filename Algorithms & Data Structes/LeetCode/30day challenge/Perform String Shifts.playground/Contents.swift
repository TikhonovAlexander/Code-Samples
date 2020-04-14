import UIKit


// You are given a string s containing lowercase English letters, and a matrix shift, where shift[i] = [direction, amount]:

// direction can be 0 (for left shift) or 1 (for right shift).
// amount is the amount by which string s is to be shifted.
// A left shift by 1 means remove the first character of s and append it to the end.
// Similarly, a right shift by 1 means remove the last character of s and add it to the beginning.
// Return the final string after all operations.

// Input: s = "abc", shift = [[0,1],[1,2]]
// Output: "cab"
// Explanation:
// [0,1] means shift to left by 1. "abc" -> "bca"
// [1,2] means shift to right by 2. "bca" -> "cab"

func stringShift(_ s: String, _ shift: [[Int]]) -> String {
    var direction = 0
    for pair in shift {
        direction += pair[0] == 0 ? -pair[1] : pair[1]
    }
    direction = direction % s.count
    direction = direction > 0 ? direction : s.count + direction
    let result = s + s
    print(direction, result)
    let middle = result.index(result.startIndex, offsetBy: result.count / 2)
    let start = result.index(middle, offsetBy: -direction)
    let end = result.index(start, offsetBy: s.count - 1)
    let head = String(result[start...end])
    return head
}

// stringShift("abc", [[0,1],[1,2]]) // cab
// stringShift("abcdefg", [[1,1],[1,1],[0,2],[1,3]]) // efgabcd
// stringShift("abc", [[1,99]]) // abc
// stringShift("wpdhhcj", [[0,7],[1,7],[1,0],[1,3],[0,3],[0,6],[1,2]])



