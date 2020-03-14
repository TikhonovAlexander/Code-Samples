import UIKit

// Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
// An input string is valid if:
//
// Open brackets must be closed by the same type of brackets.
// Open brackets must be closed in the correct order.
// Note that an empty string is also considered valid.


func isValid(_ s: String) -> Bool {
    var stack: [Character] = []
    let cache: [Character: Character] = ["[": "]", "(":")", "{":"}" ]
    for i in s {
        switch i {
        case "(", "[", "{" :
            stack.append(i)
        case ")", "]", "}" :
            if let l = stack.last, i == cache[l] {
                stack.removeLast()
            } else {
                return false
            }
        default:
            break
        }
    }
    return stack.isEmpty
}

isValid("]")
isValid("[")
isValid("")
isValid("[]()")
isValid("[]]()")
isValid("[]({})")
isValid("][")
isValid("]()())(")
isValid("([)]")
isValid("{[]}")
isValid("([)]")
