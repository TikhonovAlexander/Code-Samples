import UIKit

// Given two strings text1 and text2, return the length of their longest common subsequence.

// A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.

// If there is no common subsequence, return 0.

// "abcdef" "cwe" -> "ce"

func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    
    var cache = [[Int]](repeating: [Int](repeating: -1, count: text2.count), count: text1.count)
    
    func lcs(text1: String, i: String.Index, text2: String, j: String.Index) -> Int {
        if i == text1.endIndex || j == text2.endIndex {
            return 0
        }
        
        let x = i.utf16Offset(in: text1)
        let y = j.utf16Offset(in: text2)
        if cache[x][y] != -1 {
            return cache[x][y]
        }
        
        if text1[i] == text2[j] {
            let result = 1 + lcs(text1: text1, i: text1.index(after: i), text2: text2, j: text2.index(after: j))
            cache[x][y] = result
            return cache[x][y]
        }
        let case1 = lcs(text1: text1, i: text1.index(after: i), text2: text2, j: j)
        let case2 = lcs(text1: text1, i: i, text2: text2, j: text2.index(after: j))
        cache[x][y] = max(case1, case2)
        return cache[x][y]
    }

    if text1.isEmpty || text2.isEmpty { return 0 }
    return lcs(text1: text1, i: text1.startIndex, text2: text2, j: text2.startIndex)
}

 longestCommonSubsequence("abcde", "ace")
 longestCommonSubsequence("oxcvwf", "shmrcypy")
// longestCommonSubsequence("abc", "abc")
// longestCommonSubsequence("a", "a")
// longestCommonSubsequence("a", "w")
// longestCommonSubsequence("abc", "def")
// longestCommonSubsequence("abcdef", "cwe")
