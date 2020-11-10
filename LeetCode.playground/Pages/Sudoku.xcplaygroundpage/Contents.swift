//: [Previous](@previous)

import Foundation

class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        
    }
    
    func possiable(x: Int, y: Int, board: [[Int]]) -> [Int] {
        var res = [Int]()
        return res
    }
    
    func box(x: Int, y: Int) -> [(x:Int, y:Int)] {
        var res = [(Int, Int)]()
        for i in 0..<3 {
            for j in 0..<3 {
                res.append((i + x / 3 * 3, j + y / 3 * 3))
            }
        }
        return res
    }
}

Solution().box(x: 7, y: 8)
//: [Next](@next)
