import UIKit


//Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:

//Any left parenthesis '(' must have a corresponding right parenthesis ')'.
//Any right parenthesis ')' must have a corresponding left parenthesis '('.
//Left parenthesis '(' must go before the corresponding right parenthesis ')'.
//'*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
//An empty string is also valid.

func checkValidString(_ s: String) -> Bool {
    var stack: [Character] = []
    
    for symbol in s {
        if symbol == "(" {
            stack.append(symbol)
        }
        if symbol == "*" {
            stack.append(symbol)
        }
        if symbol == ")" {
            if let index = stack.lastIndex(of: "(") {
                stack.remove(at: index)
            } else {
                if stack.isEmpty {
                    return false
                } else {
                    stack.removeLast()
                }
            }
        }
    }
    var newStack: [Character] = []
    for symbol in stack {
        if symbol == "(" {
            newStack.append(symbol)
        }
        if symbol == "*" {
            if !newStack.isEmpty {
                newStack.removeLast()
            }
        }
    }
    return newStack.isEmpty
}

checkValidString("(())((())()()(*)(*()(())())())()()((()())((()))(*")

checkValidString("(*()")
checkValidString("()")
checkValidString("(*)")
checkValidString("*()")
checkValidString("()*")
checkValidString(")*(")
checkValidString(")(*")
checkValidString("(*(")
checkValidString("))")
checkValidString("**")
checkValidString("*")
checkValidString("")
