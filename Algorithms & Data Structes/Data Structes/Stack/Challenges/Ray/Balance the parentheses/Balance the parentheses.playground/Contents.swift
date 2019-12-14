import UIKit

// Key points
// • A stack is a LIFO, last-in first-out, data structure.
// • Despite being so simple, the stack is a key data structure for many problems.
// • The only two essential operations for the stack are the push method for adding elements and the pop method for removing elements.

struct Stack<T> {
    
    private var storage: [T] = []
    
    var peek: T? {
        storage.last
    }
    
    var isEmpty: Bool {
        storage.isEmpty
    }
    
    mutating func pop() -> T? {
        storage.popLast()
    }
    
    mutating func push(value: T) {
        storage.append(value)
    }
    
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: T...) {
        storage = elements
    }
}

extension Stack: CustomDebugStringConvertible {
    var debugDescription: String {
        storage.debugDescription
    }
}

var stack: Stack = [1.0, 2.0, 3.0, 4.0]

// 1
// h((e))llo(world)() // balanced parentheses
// 2
// (hello world // unbalanced parentheses

func checkBalanceOfParentheses(string: String) -> Bool {
    
    var balancesStack: Stack<Character> = []
    for i in string {
        if i == "(" {
            balancesStack.push(value: i)
        }
        if i == ")" {
            guard !balancesStack.isEmpty else { return false }
            balancesStack.pop()
        }
    }
    return balancesStack.isEmpty
}

checkBalanceOfParentheses(string: "h((e))llo(world)() ")
checkBalanceOfParentheses(string: "(hello world")
checkBalanceOfParentheses(string: "hello ))world")
checkBalanceOfParentheses(string: "hello ))((world")
checkBalanceOfParentheses(string: "he((llo )((wo )r )d)")
