//: [Previous](@previous)

import Foundation

class Solution {
	func myAtoi(_ str: String) -> Int {
		var res = 0
		var negative = false
		
		var input = str.trimmingCharacters(in: .whitespaces)
		if input.count == 0 {
			return 0
		}
		let first = input[input.startIndex]
		if first == "-" {
			negative = true
			input = String(input.dropFirst())
		}
		if first == "+" {
			input = String(input.dropFirst())
		}
		for c in Array(input) {
			guard let ascii = c.asciiValue, ascii >= 48, ascii <= 57 else {
				break
			}
			let n = Int(ascii - 48)
			res = res * 10 + n
			if res >= Int32.max || (-res <= Int32.min && negative) {
				break
			}
		}
		if negative {
			res = -res
		}
		if (res > Int32.max) {
			return Int(Int32.max)
		}
		if (res < Int32.min) {
			return Int(Int32.min)
		}
		return res
	}
}

Solution().myAtoi("")
Solution().myAtoi("4193 with words")
Solution().myAtoi("20000000000000000000")
Solution().myAtoi(" +197723j")

//: [Next](@next)
