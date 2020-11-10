//: [Previous](@previous)

import Foundation


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
	func averageOfLevels(_ root: TreeNode?) -> [Double] {
		var sums = [Int](), counts = [Int]()
		
		func dfs(_ node: TreeNode?, _ level: Int) {
			guard let node = node else {
				return
			}
			if sums.count == level {
				sums.append(node.val)
				counts.append(1)
			} else {
				sums[level] += node.val
				counts[level] += 1
			}
			
			dfs(node.left, level + 1)
			dfs(node.right, level + 1)
		}

		dfs(root, 0)
		return zip(sums, counts).map { Double($0) / Double($1) }

	}
}

//: [Next](@next)
