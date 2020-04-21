import UIKit


// This is the BinaryMatrix's API interface.
// You should not implement it, or speculate about itimplementation
public class BinaryMatrix {
    public func get(_ x: Int, _ y: Int) -> Int { return 0 }
    public func dimensions() -> [Int] { [] }
}


class Solution {
    func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
        
        let dimensions = binaryMatrix.dimensions()
        let n = dimensions[0]
        let m = dimensions[1]
        
        var i = 0
        var j = m - 1
        var result = -1
        while i < n && j >= 0 {
            if binaryMatrix.get(i, j) == 1 {
                result = j
                j -= 1
                continue
            }
            if binaryMatrix.get(i, j) == 0 {
                i += 1
                continue
            }
        }
        
        return result
    }
}
