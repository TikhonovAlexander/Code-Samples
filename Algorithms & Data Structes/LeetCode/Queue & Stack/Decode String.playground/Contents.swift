import UIKit

// Given an encoded string, return its decoded string.

// The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

// You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.

// Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

// s = "3[a]2[bc]", return "aaabcbc".
// s = "3[a2[c]]", return "accaccacc".
func decodeString(_ s: String) -> String {
    
    var countStack: [Int] = []
    var stringStack: [String] = []
    
    let s = Array(s)
    var i = 0
    var result = ""
    while i < s.count {
        if s[i] >= "0" && s[i] <= "9" {
            var count = 0
            while s[i] >= "0" && s[i] <= "9" {
                count = 10 * count + Int(String(s[i]))!
                i += 1
            }
            countStack.append(count)
        } else if s[i] == "[" {
            stringStack.append(result)
            result = ""
            i += 1
        } else if s[i] == "]" {
            if var str = stringStack.popLast(), let count = countStack.popLast() {
                for _ in 0..<count {
                    str.append(result)
                }
                result = str
            }
            i += 1
        } else {
            result.append(s[i])
            i += 1
        }
        
            
        
    }
    return result
}

decodeString("3[a2[c]]")
