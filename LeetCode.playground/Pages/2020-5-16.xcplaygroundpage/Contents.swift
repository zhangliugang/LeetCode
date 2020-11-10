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
    
    func largestNumber(_ cost: [Int], _ target: Int) -> String {
        
        return ""
    }
    
    
    func goodNodes(_ root: TreeNode?) -> Int {
        if (root == nil) { return 0 }
        var count = 0
        func good(_ node: TreeNode?, _ m: Int, _ count: inout Int) {
            if node != nil {
                if node!.val >= m {
                    count += 1
                }
                good(node?.left, max(node!.val, m), &count)
                good(node?.right, max(node!.val, m), &count)
            }
        }
        good(root, root!.val, &count)
        return count
    }
    
    func maxPower(_ s: String) -> Int {
        if s.count == 0 { return 0}
        var n = 1, n2 = 01
        var temp = s.first
        for i in 1..<s.count {
            let c = s[s.index(s.startIndex, offsetBy: i)]
            if c == temp {
                n += 1
            } else {
                n2 = max(n, n2)
                n = 1
                temp = c
            }
        }
        n2 = max(n, n2)
        return n2
    }
    
    func simplifiedFractions(_ n: Int) -> [String] {
        func gcd(_ a: Int, _ b: Int) -> Int {
            let r = a % b
            if r != 0 {
              return gcd(b, r)
            } else {
              return b
            }
        }
        
        if (n == 1) { return [] }
        
        var res = [String]()
        for i in 2...n {
            for j in 1..<i {
                if gcd(i, j) == 1 {
                    res.append("\(j)/\(i)")
                }
            }
        }
        return res
        
        
    }
}

Solution().largestNumber([7,6,5,5,5,6,8,7,8], 12)
//: [Next](@next)
