//: [Previous](@previous)

import Foundation

class Solution {
	func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {

		let pd = points.map {($0, $0[0] * $0[0] + $0[1] * $0[1])}
		var res = [([Int], Int)]()
		for p in pd {
			var appended = false
			for i in 0..<min(K, res.count) {
				if p.1 < res[i].1 {
					res.insert(p, at: i)
					appended = true
					break
				}
			}
			if !appended || res.count == 0{
				res.append(p)
			}
		}
		return Array(res[0..<K].map {$0.0})
	}
}

Solution().kClosest([[6,10],[-3,3],[-2,5],[0,2]], 3)
