import UIKit

//Write a function that reverses a string. The input string is given as an array of characters char[].

//Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

//You may assume all the characters consist of printable ascii characters.

// Input: ["h","e","l","l","o"]
// Output: ["o","l","l","e","h"]

class Solution {
    func reverse(_ s: inout [Character], left: Int, right: Int) {
        guard left <= right else { return }
        s.swapAt(left, right)
        reverse(&s, left: left + 1, right: right - 1)
    }
    
    // 50% faster
    func reverseString(_ s: inout [Character]) {
        reverse(&s, left: 0, right: s.count - 1)
    }
    
    // 99% faster
    func reverseString1(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        var temp: Character = "2"
        while left <= right {
            temp = s[right]
            s[right] = s[left]
            s[left] = temp
            left += 1
            right -= 1
        }
    }
}

let given1: [Character] = ["h","e","l","l","o"]
let expected1: [Character] = ["o","l","l","e","h"]
var result1 = given1
Solution().reverseString1(&result1)
result1 == expected1

let given2: [Character] = []
let expected2: [Character] = ["h"]
var result2 = given2
Solution().reverseString1(&result2)
result2 == expected2
