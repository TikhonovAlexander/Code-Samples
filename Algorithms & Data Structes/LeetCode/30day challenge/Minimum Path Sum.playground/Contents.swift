import UIKit


// Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

// Note: You can only move either down or right at any point in time.

func minPathSumRecursive(_ grid: [[Int]], row: Int, column: Int, sum: Int, result: inout Int) {
    
    let rows = grid.count - 1
    let columns = grid.first!.count - 1
    if row == rows && column == columns {
        result = min(result, sum + grid[rows][columns])
        return
    }
    
    let sum = sum + grid[row][column]
    
    guard sum < result else { return }
    
    if row != rows {
        minPathSumRecursive(grid, row: row + 1, column: column, sum: sum, result: &result)
    }
    if column != columns {
        minPathSumRecursive(grid, row: row, column: column + 1, sum: sum, result: &result)
    }
}

func minPathSum1(_ grid: [[Int]]) -> Int {
    var result = Int.max
    minPathSumRecursive(grid, row: 0, column: 0, sum: 0, result: &result)
    return result
}

func minPathSum2(_ grid: [[Int]]) -> Int {
    
    var array = [[Int]]()
    
    let rows = grid.count
    let columns = grid.first!.count
    
    for i in 0..<rows {
        
        array.append([Int].init(repeating: 0, count: columns))
        
        for j in 0..<columns {
            
            if i == 0 && j == 0 {
                array[i][j] = grid[i][j]
                continue
            }
            if i == 0 {
                array[i][j] = grid[i][j] + array[i][j - 1]
                continue
            }
            if j == 0 {
                array[i][j] = grid[i][j] + array[i - 1][j]
                continue
            }
            array[i][j] = min(grid[i][j] + array[i][j - 1], grid[i][j] + array[i - 1][j])
            
        }
    }
    
    return array[rows - 1][columns - 1]
}


minPathSum1([
    [1,3,1],
    [1,5,1],
    [4,2,1]
])

minPathSum1([
    [1,3,1],
    [1,0,1],
    [4,2,1]
])

minPathSum1([
    [1,0,1],
    [1,0,1],
    [4,2,1]
])

minPathSum1([
    [1,0,1],
    [1,0,0],
    [4,2,1]
])

minPathSum1([
    [9]
])
