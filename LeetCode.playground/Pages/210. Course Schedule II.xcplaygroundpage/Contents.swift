//: [Previous](@previous)

import Foundation

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var edge = [Int: [Int]]()
        var visited = Array(repeating: 0, count: numCourses)
        var stack = [Int]()
        var cycle = false
        
        func dfs(_ i: Int) {
            visited[i] = 1
            defer {
                visited[i] = 2
                stack.append(i)
            }
            guard let e = edge[i] else {
                return
            }
            for j in e {
                if visited[j] == 0 {
                    dfs(j)
                    if cycle {
                        return
                    }
                } else if visited[j] == 1{
                    cycle = true
                    return
                }
            }
            
        }
        
        
        for p in prerequisites {
            if (!edge.keys.contains(p[1])) {
                edge[p[1]] = [Int]()
            }
            edge[p[1]]?.append(p[0])
        }

        for i in 0..<numCourses {
            if visited[i] == 0 && !cycle {
                dfs(i)
            }
        }
        
        if cycle {
            return []
        }
        return stack.reversed()
    }
}

Solution().findOrder(4, [[1,0],[2,0],[3,1],[3,2]])
//: [Next](@next)
