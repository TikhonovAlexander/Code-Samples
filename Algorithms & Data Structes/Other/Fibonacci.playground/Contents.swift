import UIKit

// Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1
// F(0) = 0
// F(1) = 1
// F(n) = F(n - 1) + F(n - 2)

// N =    1 2 3 4 5 6 7  8  9 10 ...
// F(N) = 0 1 1 2 3 5 8 13 21 34 ...

// help links
// https://leetcode.com/articles/fibonacci-number/

// Recursive approach
// Time complexity - O(2^N)
// Space complexity - O(N)
func fibonacciRecursive(N: Int) -> Int {
    guard N != 1 else { return 0 } // base case
    guard N != 2 else { return 1 } // base case
    return fibonacciRecursive(N: N - 1) + fibonacciRecursive(N: N - 2)
}

// Iterative approach
// Time complexity - O(N)
// Space complexity - O(1)
func fibonacciIterative(N: Int) -> Int {
    guard N != 1 else { return 0 }
    guard N != 2 else { return 1 }
    var counter = 2
    var i = 0
    var j = 1
    var temp = 0
    while counter != N {
        temp = j
        j += i
        i = temp
        counter += 1
    }
    return j
}

// Improved recursive approach, using tail recursion (works like Iterative approach)
// Time complexity - O(N)
// Space complexity - O(N) // not sure about this
func fibonacciImprovedRecursive(N: Int) -> Int {
    guard N != 1 else { return 0 } // base case
    guard N != 2 else { return 1 } // base case
    func fibonacci(N: Int, previous: Int = 0, current: Int = 1) -> Int {
        guard N != 0 else { return current }
        return fibonacci(N: N - 1, previous: current, current: previous + current)
    }
    return fibonacci(N: N - 2)
}
