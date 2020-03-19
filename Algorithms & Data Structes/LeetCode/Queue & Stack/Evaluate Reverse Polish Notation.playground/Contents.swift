import UIKit

//Evaluate the value of an arithmetic expression in Reverse Polish Notation.
//
//Valid operators are +, -, *, /. Each operand may be an integer or another expression.
//
//Division between two integers should truncate toward zero.
//The given RPN expression is always valid. That means the expression would always evaluate to a result and there won't be any divide by zero operation.

// Input: ["4", "13", "5", "/", "+"]
// Output: 6
// Explanation: (4 + (13 / 5)) = 6

func evalRPN(_ tokens: [String]) -> Int {
    
    var queue: [Int] = []
    
    for token in tokens {
        switch token {
        case "+":
            let l1 = queue.popLast()!
            let l2 = queue.popLast()!
            queue.append(l1 + l2)
        case "-":
            let l1 = queue.popLast()!
            let l2 = queue.popLast()!
            queue.append(l2 - l1)
        case "*":
            let l1 = queue.popLast()!
            let l2 = queue.popLast()!
            queue.append(l1 * l2)
        case "/":
            let l1 = queue.popLast()!
            let l2 = queue.popLast()!
            queue.append(l2 / l1)
        default:
            let number = Int(token)!
            queue.append(number)
        }
    }
    return queue.first!
}

evalRPN(["2", "1", "+", "3", "*"])
evalRPN(["4", "13", "5", "/", "+"])
evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"])
