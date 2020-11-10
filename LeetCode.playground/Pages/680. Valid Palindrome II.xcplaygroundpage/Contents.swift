//: [Previous](@previous)

import Foundation

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        var str = s.map { $0 }
        func isPalindrome(_ str: [Character], _ start: Int, _ end: Int) -> Bool {
            var i = start, j = end
            while i < j {
                if str[i] != str[j] {
                    return false
                }
                i += 1
                j -= 1
            }
            return true
        }
        
        var i = 0, j = str.count - 1
        while i < j {
            if str[i] != str[j] {
                return isPalindrome(str, i, j - 1) || isPalindrome(str, i + 1, j)
            }
            i += 1
            j -= 1
        }
        
        return true
    }
}

Solution().validPalindrome("abb")

//: [Next](@next)
