import UIKit

// Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

// Input:
// 11110
// 11010
// 11000
// 00000

// Output: 1

// Input:
// 11000
// 11000
// 00100
// 00011

// Output: 3


func numIslands(_ grid: [[Character]]) -> Int {
    
    guard let isEmpty = grid.first?.isEmpty, !isEmpty else {
        return 0
    }
    
    var result = 0
    
    var queue = [(Int, Int)]()
    
    var cache: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: grid.first!.count), count: grid.count)
    
    for i in 0..<grid.count {
        for j in 0..<grid[i].count where grid[i][j] == "1" && !cache[i][j] {
            result += 1
            queue.append((i, j))
            while let (i, j) = queue.popLast() {
                if i - 1 >= 0 && !cache[i - 1][j] && grid[i - 1][j] == "1" {
                    queue.append((i - 1, j))
                    cache[i - 1][j] = true
                }
                if j + 1 < grid.first!.count && !cache[i][j + 1] && grid[i][j + 1] == "1" {
                    queue.append((i, j + 1))
                    cache[i][j + 1] = true
                }
                if i + 1 < grid.count && !cache[i + 1][j] && grid[i + 1][j] == "1" {
                    queue.append((i + 1, j))
                    cache[i + 1][j] = true
                }
                if j - 1 >= 0 && !cache[i][j - 1] && grid[i][j - 1] == "1" {
                    queue.append((i, j - 1))
                    cache[i][j - 1] = true
                }
            }
        }
    }
    
    return result
}



numIslands([
    ["1","0","1","1","1"],
    ["1","0","1","0","1"],
    ["1","1","1","0","1"],]
)

numIslands([
    ["1", "1", "1"],
    ["0", "1", "0"],
    ["1", "1", "1"],]
)

numIslands([
    ["1", "1", "1", "1", "0"],
    ["1", "1", "0", "1", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "0", "0", "0"],]
)

numIslands([
    ["1", "1", "0", "0", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "1", "0", "0"],
    ["0", "0", "0", "1", "1"],]
)
