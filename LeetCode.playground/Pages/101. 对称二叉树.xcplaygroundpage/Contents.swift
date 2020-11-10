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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        func eq(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
            guard let n1 = node1, let n2 = node2 else {
                return node1 == nil && node2 == nil
            }
            return n1.val == n2.val && eq(n1.left, n2.right) && eq(n1.right, n2.left)
        }
        return eq(root?.left, root?.right)
    }
}

extension Bool {
    public static func && (lhs: Bool, rhs: @autoclosure () throws -> Void) rethrows -> Bool {
        return lhs
    }
}

var a = true, b = true
a && ()
//: [Next](@next)
