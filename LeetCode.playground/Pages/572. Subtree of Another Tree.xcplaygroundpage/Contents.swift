//: [Previous](@previous)

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
 
class Solution {
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        }
        if s == nil && t != nil {
            return false
        }
        return isSametree(s, t) || isSubtree(s?.left, t) || isSubtree(s?.right, t)
    }

    func isSametree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        }
        return s?.val == t?.val && isSametree(s?.left, t?.left) && isSametree(s?.right, t?.right)
    }
}

let s = TreeNode(4, TreeNode(1, TreeNode(0), nil), TreeNode(2))
let t = TreeNode(4, TreeNode(1), TreeNode(2))

print(Solution().isSubtree(s, t))

//: [Next](@next)
