//: [Previous](@previous)

import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var res = nums[0]
        var sum = 0
        for n in nums {
            if sum > 0 {
                sum += n
            } else {
                sum = n
            }
            res = max(res, sum)
        }
        return res
    }
}
//: [Next](@next)
