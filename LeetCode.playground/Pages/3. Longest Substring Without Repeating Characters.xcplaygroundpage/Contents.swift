/*:
 Given a string, find the length of the longest substring without repeating characters.
 
     Given "abcabcbb", the answer is "abc", which the length is 3.
 
     Given "bbbbb", the answer is "b", with the length of 1.
 
     Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */


//: [Previous](@previous)

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = s.cString(using: .utf8)!.dropLast()
        let n = chars.count
        
        var set = Set<Int8>()
        var count = 0, i = 0, j = 0
        while i < n && j < n {
            if set.contains(chars[j]) {
                set.remove(chars[i])
                i += 1
            } else {
                set.insert(chars[j])
                j += 1
                count = max(count, j - i)
            }
        }
        
        return count
    }
    
}

let s = "bbbbbbbb"

Solution().lengthOfLongestSubstring(s)
//: [Next](@next)
