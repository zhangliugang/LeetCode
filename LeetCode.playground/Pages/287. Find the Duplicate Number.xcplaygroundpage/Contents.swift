//: [Previous](@previous)

import Foundation

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var res = 0, fast = 0
        while true {
            res = nums[res]
            fast = nums[nums[fast]]
            if fast == res {
                break
            }
        }
        
        fast = 0
        while fast != res {
            res = nums[res]
            fast = nums[fast]
        }
        
        return res
    }

}

Solution().findDuplicate([2,5, 9 ,6,9,3,8, 9 ,7,1])
