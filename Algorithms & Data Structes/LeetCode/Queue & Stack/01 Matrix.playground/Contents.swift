import UIKit

var str = "Hello, playground"

func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
    
    var result = [[Int]](repeating: [Int](repeating: .max - 10000, count: matrix[0].count), count: matrix.count)
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            if matrix[i][j] == 0 {
                result[i][j] = 0
            } else {
                if i > 0 {
                    result[i][j] = min(result[i][j], result[i - 1][j] + 1)
                }
                if j > 0 {
                    result[i][j] = min(result[i][j], result[i][j - 1] + 1)
                }
            }
        }
    }
    
    for i in stride(from: matrix.count - 1, through: 0, by: -1) {
        for j in stride(from: matrix[0].count - 1, through: 0, by: -1) {
            if i < matrix.count - 1 {
                result[i][j] = min(result[i][j], result[i + 1][j] + 1)
            }
            if j < matrix[0].count - 1 {
                result[i][j] = min(result[i][j], result[i][j + 1] + 1)
            }
        }
    }
    return result
}

for i in stride(from: 3, through: 0, by: -1) {
    print(i)
}

var a = [[0,0,0],
         [0,1,0],
         [0,0,0]]
updateMatrix(a)

var b = [[0,0,0],
         [0,1,0],
         [1,1,1]]
updateMatrix(b)
