//: [Previous](@previous)

import Foundation

class MinStack {
    
    class Node {
        let val: Int
        let min: Int
        let next: Node?
        
        init(_ val: Int, _ min: Int, _ next: Node?) {
            self.val = val
            self.min = min
            self.next = next
        }
        
        convenience init(_ val: Int, _ min: Int) {
            self.init(val, min, nil)
        }
    }
    
    var head: Node?

    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        if head == nil {
            head = Node(x, x)
        } else {
            head = Node(x, min(x, head!.min), head)
        }
    }
    
    func pop() {
        head = head?.next
    }
    
    func top() -> Int {
        return head!.val
    }
    
    func getMin() -> Int {
        return head!.min
    }
}


//: [Next](@next)
