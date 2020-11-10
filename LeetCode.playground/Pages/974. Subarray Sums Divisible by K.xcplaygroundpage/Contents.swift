//: [Previous](@previous)

import Foundation

class Solution {
    func subarraysDivByK(_ A: [Int], _ K: Int) -> Int {
        var map = [Int: Int]()
        map[0] = 1
        var res = 0
        var sum = 0
        for n in A {
            sum = (sum + n) % K
            if (sum < 0) {
                sum += K
            }
            res += map[sum] ?? 0
            map[sum, default: 0] += 1
        }
        
        return res
    }
}

Solution().subarraysDivByK([4,5,0,-2,-3,1], 5)
//: [Next](@next)
