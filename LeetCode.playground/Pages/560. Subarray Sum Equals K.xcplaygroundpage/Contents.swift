//: [Previous](@previous)

import Foundation

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var map = [Int:Int]()
        map[0] = 1
        var sum = 0
        var res = 0
        for n in nums {
            sum += n
            if let value = map[sum - k] {
                res += value
            }
            map[sum] = (map[sum] ?? 0) + 1
        }
        
        
        return res
    }
}


Solution().subarraySum([0,0,0,0], 0)

//: [Next](@next)
