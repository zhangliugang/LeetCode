//: [Previous](@previous)

import Foundation

class Solution {
    func findTheLongestSubstring(_ s: String) -> Int {
        var pos = Array(repeating: -1, count: 32)
        pos[0] = 0
        var v = ["a": 1, "e": 2, "i": 4, "u": 8, "o": 16]
        var xor = 0
        var res = 0
        for (i, c) in s.enumerated() {
            if c == "a" || c == "i" || c == "e" || c == "u" || c == "o" {
                xor ^= v[String(c)]!
            }
            if pos[xor] >= 0 {
                res = max(res, i - pos[xor] + 1)
            } else {
                pos[xor] = i + 1
            }
        }
        
        return res
    }
}

Solution().findTheLongestSubstring("eleetminicoworoep")
//: [Next](@next)
