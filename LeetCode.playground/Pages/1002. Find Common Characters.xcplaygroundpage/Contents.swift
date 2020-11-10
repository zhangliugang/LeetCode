//: [Previous](@previous)

import Foundation

class Solution {
    func commonChars(_ A: [String]) -> [String] {
        var chars = Array(repeating: 0, count: 26);
        let a = 97
        
        for c in A[0].unicodeScalars {
            chars[Int(c.value) - a] += 1;
        }
        
        for i in 1..<A.count {
            var temp = Array(repeating: 0, count: 26);
            for c in A[i].unicodeScalars {
                temp[Int(c.value) - a] += 1;
            }
            for i in 0..<26 {
                chars[i] = min(chars[i], temp[i])
            }
        }
        print(chars)
        
        var res = [String]()
        for i in 0..<chars.count {
            for _ in 0..<chars[i] {
                res.append(String(Unicode.Scalar(i + a)!))
            }
        }
        
        
        return res;
    }
}

print(Solution().commonChars(["bella","label","roller"]))
//: [Next](@next)
