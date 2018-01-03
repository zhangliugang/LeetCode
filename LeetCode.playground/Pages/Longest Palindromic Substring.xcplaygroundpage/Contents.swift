/*:
Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

Example:

    Input: "babad"

    Output: "bab"

    Note: "aba" is also a valid answer.

Example:

    Input: "cbbd"

    Output: "bb"
 */

//: [Previous](@previous)

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> String {
//        let slice = Array(s.utf8)
//        let chars = s.cString(using: .utf8)!.dropLast()
        var result = s[s.startIndex]
        
        for char in s {
            let index = s.index(of: char)!
        }
        
        return String(result)
    }
}

Solution().longestPalindrome("asdfsdfwe")
//: [Next](@next)

//: [Next](@next)
