//: [Previous](@previous)

import Foundation

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var res = Int.min, max_v = 1, min_v = 1
        for n in nums {
            if n < 0 {
                let temp = max_v
                max_v = max(n, n * min_v)
                min_v = min(n, n * temp)
            } else {
                max_v = max(n, n * max_v)
                min_v = min(n, n * min_v)
            }
            print("max:\(max_v), min:\(min_v)")

            res = max(max_v, res)
        }
        return res
    }
    
    func numPoints(_ points: [[Int]], _ r: Int) -> Int {
        let x = points.map { $0.first! }
        let y = points.map { $0.last! }
        var res = 0
        for i in x {
            for j in y {
                var count = 0
                for p in points {
                    let R = sqrt(Double((p.first! - i) ^ 2 + (p.last! - j) ^ 2))
                    if R <= Double(r) {
                        count += 1
                    }
                }
                res = max(res, count)
            }
        }
        return res
    }
}

Solution().maxProduct([])

//: [Next](@next)
