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
    func maxDotProduct(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count, m = nums2.count
        var dp = Array(repeating: Array(repeating: -1_000_000, count: m + 1), count: n + 1)
        
        for i in 1...n {
            for j in 1...m {
                if dp[i - 1][j - 1] > 0 {
                    dp[i][j] = max((dp[i - 1][j - 1] + (nums1[i - 1] * nums2[j - 1])), dp[i][j - 1], dp[i - 1][j])
                } else {
                    dp[i][j] = max((nums1[i - 1] * nums2[j - 1]), dp[i][j - 1], dp[i - 1][j])
                }
            }
        }
        return dp[n][m]
    }
    
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        var res = 0
        let array = Array(repeating: 0, count: 10)
        
        func palin(_ node: TreeNode, _ res: inout Int, array: [Int]) {
            var temp = array
            temp[node.val] += 1
            
            if node.left == nil && node.right == nil {
                print(temp)
                if temp.filter({ $0.isMultiple(of: 2) == false }).count <= 1 {
                    res += 1
                }
            } else {
                if node.left != nil {
                    palin(node.left!, &res, array: temp)
                }
                if node.right != nil {
                    palin(node.right!, &res, array: temp)
                }
            }
        }
        
        if root != nil {
            palin(root!, &res, array: array)
        }
        
        return res
    }
    
    func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
        let array = sentence.split(separator: " ")
        for (i, s) in array.enumerated() {
            if s.count >= searchWord.count {
                if s.starts(with: searchWord) {
                    return i + 1
                }
            }
        }
        return -1
    }
    
    func maxVowels(_ s: String, _ k: Int) -> Int {
        let set = Set<Character>(arrayLiteral: "a", "i", "e", "u", "o")
        func vowel(_ s: Character) -> Bool {
            return set.contains(s)
        }
        let string = Array(s)
        
        var i = 0
        var cnt = 0
        for idx in 0..<k {
            if vowel(string[i + idx]) {
                cnt += 1
            }
        }
        
        var res = cnt
        var j = i + k
        while j != string.count {
            if vowel(string[j]) {
                cnt += 1
            }
            if vowel(string[i]) {
                cnt -= 1
            }
            res = max(res, cnt)
            i += 1
            j += 1
        }
        return res
    }
}

//let root = TreeNode(2, TreeNode(3, TreeNode(3), TreeNode(1)), TreeNode(1, nil, TreeNode(1)))

Solution().maxDotProduct([2,1,-2,5], [3,0,-6])
Solution().maxDotProduct([-1,-1], [1,1])



//: [Next](@next)
