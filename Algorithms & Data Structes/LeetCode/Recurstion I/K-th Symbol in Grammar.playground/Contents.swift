import UIKit

var str = "Hello, playground"

// On the first row, we write a 0. Now in every subsequent row, we look at the previous row and replace each occurrence of 0 with 01, and each occurrence of 1 with 10.

// Given row N and index K, return the K-th indexed symbol in row N. (The values of K are 1-indexed.) (1 indexed).

// Examples:
// Input: N = 1, K = 1
// Output: 0

// Input: N = 2, K = 1
// Output: 0

// Input: N = 2, K = 2
// Output: 1

// Input: N = 4, K = 5
// Output: 1

// Explanation:
// 1  row 0: 0
// 2  row 1: 01
// 4  row 2: 0110
// 8  row 3: 01101001
// 16 row 4: 0110100110010110
// 32 row 5: 01101001100101101001011001101001

// N will be an integer in the range [1, 30].
// K will be an integer in the range [1, 2^(N-1)].

// f(N, K) = f(N - 1, K), if K <= N / 2  or !f(N - 1, N - K) if K > N / 2

func kthGrammar(_ N: Int, _ K: Int) -> Int {
    return kthGrammar3(N, K)
}

func kthGrammar3(_ N: Int, _ K: Int) -> Int {
    if N == 1 {
        return 0
    }

    if K % 2 == 0 {
        return kthGrammar(N - 1, K / 2) == 0 ? 1: 0
    }
    return kthGrammar(N - 1, (K + 1) / 2) == 0 ? 0: 1
}
 
//kthGrammar(1, 1)
//kthGrammar(2, 1)
//kthGrammar(2, 2)
kthGrammar(4, 1)
kthGrammar(4, 2)
kthGrammar(4, 3)
kthGrammar(4, 4)
kthGrammar(4, 5)
kthGrammar(4, 6)
kthGrammar(4, 7)
kthGrammar(4, 8)
//kthGrammar(7, 12)
//kthGrammar(29, 13)
//print(memo)
 
2 << 0
2 << 1
2 << 2
2 << 3
2 << 4
2 << 5
