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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        level(root, deep: 0, res: &res)
        return res
    }
    
    func level(_ node: TreeNode?, deep: Int, res: inout [[Int]]) {
        guard let node = node else { return }
        if deep >= res.count {
            res.append([Int]())
        }
        res[deep].append(node.val)
        level(node.left, deep: deep + 1, res: &res)
        level(node.right, deep: deep + 1, res: &res)
    }
}

//: [Next](@next)
