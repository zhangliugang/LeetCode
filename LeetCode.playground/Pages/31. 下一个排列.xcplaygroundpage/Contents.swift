//: [Previous](@previous)

import Foundation

class Solution {
	func nextPermutation(_ nums: inout [Int]) {
		var i = nums.count - 2
		while i >= 0 && nums[i] >= nums[i + 1] {
			i -= 1
		}
		if i >= 0 {
			var j = nums.count - 1
			while j >= 0 && nums[i] >= nums[j] {
				j -= 1
			}
			nums.swapAt(i, j)
		}
//		let range = i + 1 ..< nums.count
//		nums.replaceSubrange(range, with: nums[range].sorted())
		nums[i + 1 ..< nums.count].reverse()
	}
}

var nums = [4,5,2,6,3,1]
Solution().nextPermutation(&nums)
//: [Next](@next)
