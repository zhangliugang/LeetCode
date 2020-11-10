//: [Previous](@previous)

import Foundation

class Cashier {
    
    let n: Int
    let discount: Double
    let m: [Int: Int]
    var cnt = 0
    

    init(_ n: Int, _ discount: Int, _ products: [Int], _ prices: [Int]) {
        self.n = n
        self.discount = Double(discount)
        var m = [Int: Int]()
        for i in 0..<products.count {
            m[products[i]] = prices[i]
        }
        self.m = m
    }
    
    func getBill(_ product: [Int], _ amount: [Int]) -> Double {
        let p = Double((0..<product.count).reduce(0) { $0 + (m[product[$1]] ?? 0) * amount[$1] })
        if cnt == n - 1 {
            cnt = 0
            return p - p * discount / 100.0
        } else {
            cnt += 1
            return p
        }
    }
}

let cashier = Cashier(3,30,[1,2,3,4,5,6,7],[101,202,300,400,300,200,100])
cashier.getBill([1,2],[1,2])
cashier.getBill([3,7],[10,10])
cashier.getBill([1,2,3,4,5,6,7],[1,1,1,1,1,1,1])
cashier.getBill([4],[10])
cashier.getBill([7,3],[10,10])
cashier.getBill([7,5,3,1,6,4,2],[10,10,10,9,9,9,7])
cashier.getBill([2,3,5],[5,3,2])
//: [Next](@next)
