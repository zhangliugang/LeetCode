//: [Previous](@previous)

import Foundation

protocol MountainArray {
    func get(_ index: Int) -> Int
    func length() -> Int
}

class Solution {
    func findInMountainArray(_ target: Int, _ mountainArr: MountainArray) -> Int {
        var l = 0
        var r = mountainArr.length() - 1
        var mid = 0
        while l < r {
            mid = (l + r) / 2
            let m = mountainArr.get(mid)
            let n = mountainArr.get(mid - 1)
            let k = mountainArr.get(mid + 1)
            if m > n && m > k { break }
            else if (m < n) { l = mid }
            else { r = mid}
        }
        l = 0
        r = mid
        while l < r {
            let m = (l + r) / 2
            if mountainArr.get(m) == target {
                return m
            } else if mountainArr.get(m) > target {
                r = m
            } else {
                l = m
            }
        }
        
        l = mid
        r = mountainArr.length() - 1
        while l < r {
            let m = (l + r) / 2
            if mountainArr.get(m) == target {
                return m
            } else if mountainArr.get(m) > target {
                r = m
            } else {
                l = m
            }
        }
        
        return -1
    }
}


//: [Next](@next)
