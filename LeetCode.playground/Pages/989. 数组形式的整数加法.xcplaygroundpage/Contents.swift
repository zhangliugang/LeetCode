//: [Previous](@previous)

import Foundation

class Solution {
    func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {
        var res = [Int]()
        var h = K
        for i in 0..<A.count {
            let j = A.count - i - 1
            let n = A[j] + h
            res.append(n % 10)
            h = n / 10
        }
        while h > 0 {
            res.append(h % 10)
            h /= 10
        }
        res.reverse()
        return res
    }
}

Solution().addToArrayForm([2,7,4], 11806)
//: [Next](@next)
