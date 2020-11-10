//: [Previous](@previous)

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        var h = head
        var last: ListNode? = nil
        var n = 0
        while true {
            h = h?.next
            n += 1
            if h?.next == nil {
                last = h
                break
            }
        }
        last?.next = head
        n = k % n
        h = head
        for _ in 0..<k-n {
            h = h?.next
        }
        return h
    }
}

let root = ListNode(1)
root.next = ListNode(2)
root.next?.next = ListNode(3)
root.next?.next?.next = ListNode(4)
root.next?.next?.next?.next = ListNode(5)

var res = Solution().rotateRight(root, 2)
while (res != nil) {
    print(res?.val)
    res = res?.next
}
//: [Next](@next)
