//: [Previous](@previous)

import Foundation

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1 }
        else if n < 0 { return 1 / myPow(x, -n)}
        else if n == 1 { return x }
        else if n % 2 == 0 {
            return myPow(x * x, n / 2)
        } else {
            return myPow(x * x, (n - 1) / 2) * x
        }
    }
    
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for n in nums {
            res ^= n
        }
        return res
    }
}
