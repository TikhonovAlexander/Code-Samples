import UIKit


func allParentheses(_ N: Int) -> Set<String> {
    if N == 1 {
        return ["()"]
    }
    let previousSet = allParentheses(N - 1)
    var newSet: Set<String> = []
    for item in previousSet {
        newSet.insert(item + "()")
        newSet.insert("()" + item)
        newSet.insert("(" + item + ")")
    }
    return newSet
}

let test1 = allParentheses(1)  // ()
let test2 = allParentheses(2)  // ()()   (())
let test3 = allParentheses(3)  // ()()() (()()) (())() ()(()) ((()))

print(test1)
print(test2)
print(test3)
