//: [Previous](@previous)

import Foundation

class Solution {
//    1111 15
//    1001 9
//    1000 8
//    1011 11
//    1010 10
//    1100 12
//    1101 13
//    1110 14
//    0111
    /// - 检查一个字符串是否包含所有长度为 K 的二进制子串
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        let pow = Array(1...20).reduce(into: [Int]()) { (array, _) in
            array.append((array.last ?? 1) * 2)
        }
        
        let a = Array(repeating: "0", count: k).reduce("", +)
        if !s.contains(a) { return false }
        let b = Array(0..<pow[k - 1]).map({ String($0, radix: 2)}).map { Array(repeating: "0", count: k - $0.count).reduce("", +) + $0 }
        
        for sub in b {
            if !s.contains(sub) {
                return false
            }
        }
        return true
    }
    
    /// - 通过翻转子数组使两个数组相等
    func canBeEqual(_ target: [Int], _ arr: [Int]) -> Bool {
        let a = target + arr
        var res = 0
        for i in a {
            res ^= i
        }
        return res == 0
    }
}


Solution().hasAllCodes("00101101001010110011000110010101100011001110000111010111101001000011101001111100111000011010101011011100100101101111001110111100010111000001010101011001010100101011001011101110110111101110000011110111111101000110101111001000001000110000011110001101011101001111111111110101111110011011111101101000111110001111110011100101101000110000010100010101100011100110100111111001110100001011100001100110011001001101000111000110000100111011011"
,20)
//: [Next](@next)
