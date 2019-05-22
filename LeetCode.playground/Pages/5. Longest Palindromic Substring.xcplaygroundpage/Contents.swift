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
//
import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let input = Array(s)
		
		var left = 0, right = 0
		if input.count == 0 {
			return ""
		}
		
        for idx in 0..<input.count - 1 {
			var off = 1
			while idx - off >= 0 && idx + off < input.count {
				if input[idx - off] == input[idx + off] {
					if 2 * off + 1 > right - left {
						left = idx - off
						right = idx + off
					}
					off = off + 1
					
				} else {
					break
				}
			}
			
			if input[idx] == input[idx + 1] {
				if right - left < 2 {
					left = idx
					right = idx + 1
				}
				var off2 = 1
				while idx - off2 >= 0 && idx + off2 + 1 < input.count {
					if input[idx - off2] == input[idx + off2 + 1] {
						if 2 * (off2 + 1) > right - left {
							left = idx - off2
							right = idx + off2 + 1
						}
						off2 = off2 + 1
					} else {
						break
					}
				}
			}
        }

        return String(input[left...right])
    }
	
	
}


Solution().longestPalindrome("b")


//: [Next](@next)
