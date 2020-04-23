import UIKit


// Given a range [m, n] where 0 <= m <= n <= 2147483647, return the bitwise AND of all numbers in this range, inclusive.

// 45  101101
// 46  101110
// 47  101111
// 48  110000
// 49  110001
// 77 1001101


//    100000

func rangeBitwiseAnd2(_ m: Int, _ n: Int) -> Int {
    guard m != 0 else { return 0 }
    
    var m = m
    var n = n
    var multi = 1
    
    while m != n {
        m = m >> 1
        n = n >> 1
        multi = multi << 1
    }
    
    return m * multi
}

func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
    (m...n).reduce(2147483647, { $0 & $1 })
}

rangeBitwiseAnd2(45, 49)
rangeBitwiseAnd2(0, 1)
rangeBitwiseAnd2(0, 2147483647)

45 >> 1
49 >> 1
45 << 1
