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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 || inorder.count == 0 {
            return nil
        }
        let node = TreeNode(preorder.first!)
        let idx = inorder.firstIndex(of: preorder.first!)!
        node.left = buildTree(Array(preorder[1..<idx + 1]), Array(inorder[0..<idx]))
        node.right = buildTree(Array(preorder[idx + 1..<inorder.count]), Array(inorder[idx + 1..<inorder.count]))
        return node
    }
}

Solution().buildTree([3,9,20,15,7], [9,3,15,20,7])
//: [Next](@next)
