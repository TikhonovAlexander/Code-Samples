import UIKit

var cache: [Int: Int] = [:]

func numSquares(_ n: Int) -> Int {
    guard n != 0 else { return 0 }
    if let v = cache[n] {
        return v
    }
    var i = 1
    while i * i <= n {
        i += 1
    }
    i -= 1
    var result = Int.max
    while i > 0 {
        let r = numSquares(n % (i * i) )
        result = min( n / (i * i) + r, result)
        i -= 1
    }
    cache[n] = result
    return result
}


numSquares(9)
//numSquares(2)
//numSquares(3)
//numSquares(4)
numSquares(12)
numSquares(13)
numSquares(50)

