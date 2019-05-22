//: [Previous](@previous)

import Foundation

class Solution {
	func reverse(_ x: Int) -> Int {
		var rev = 0
		var input = x
		while input != 0 {
			let pop = input % 10
			input = input / 10
			if (rev > Int32.max / 10 || (rev == Int32.max / 10 && pop > 7)) {
				return 0
			}
			if (rev < Int32.min / 10 || (rev == Int32.min / 10 && pop < -8)) {
				return 0
			}
			rev = rev * 10 + pop
		}
		return rev
	}
}

Solution().reverse(153423649)
Solution().reverse(-2137483641)

//: [Next](@next)
