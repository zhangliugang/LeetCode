//: [Previous](@previous)

import Foundation

class Solution {
    func equationsPossible(_ equations: [String]) -> Bool {

        var table = Array(repeating: Set<Int>(), count: 26)
        for i in 0..<table.count {
            table[i].insert(i)
        }
        
        for eq in equations {
            if eq[eq.index(after: eq.startIndex)] == "=" {
                let l = Int(eq[eq.startIndex].asciiValue!) - 97
                let r = Int(eq[eq.index(before: eq.endIndex)].asciiValue!) - 97
                let union = table[l].union(table[r])
                for i in table[l] {
                    table[i] = union
                }
                for i in table[r] {
                    table[i] = union
                }
            }
        }
        print(table)
        for eq in equations {
            if eq[eq.index(after: eq.startIndex)] == "!" {
                let l = Int(eq[eq.startIndex].asciiValue!) - 97
                let r = Int(eq[eq.index(before: eq.endIndex)].asciiValue!) - 97
                if table[l].contains(r) || table[r].contains(l) {
                    return false
                }
            }
        }
        
        return true
    }
}

Solution().equationsPossible(["a==b","e==c","b==c","a!=e"])
//: [Next](@next)
