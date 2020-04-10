import UIKit

// Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.

func backspaceCompare(_ S: String, _ T: String) -> Bool {
    var stack1: [Character] = []
    
    for c in S {
        if c == "#" {
            if !stack1.isEmpty {
                stack1.removeLast()
            }
        } else {
            stack1.append(c)
        }
    }
    
    let s: String = String(stack1)
    stack1.removeAll()
    
    for c in T {
        if c == "#" {
            if !stack1.isEmpty {
                stack1.removeLast()
            }
        } else {
            stack1.append(c)
        }
    }
    
    let t: String = String(stack1)
    return s == t
}

backspaceCompare("ab#c", "ad#c")
backspaceCompare("ab##", "c#d#")
backspaceCompare("a##c", "#a#c")
backspaceCompare("a#c", "b")
backspaceCompare("##", "")
backspaceCompare("", "")
backspaceCompare("", "@2")
