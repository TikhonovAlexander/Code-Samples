import UIKit

// Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

func maximalSquare(_ matrix: [[Character]]) -> Int {
    
    // could be improved by dp
    var result = 0
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            
            if matrix[i][j] == "1" {
                
                var side = 0
                var flag = false
                label: while (i + side < matrix.count) && (j + side < matrix[0].count) {
                    if flag { break }
                    for n in i...(i + side) {
                        for m in j...(j + side) {
                            if matrix[n][m] == "0" {
                                flag = true
                                continue label
                            }
                        }
                    }
                    side += 1
                }
                result = max(result, side * side)
            }
            
        }
    }
    
    return result
}

maximalSquare([
    ["1", "0", "1", "0", "0"],
    ["1", "0", "1", "1", "1"],
    ["1", "1", "1", "1", "1"],
    ["1", "0", "0", "1", "0"],
])
