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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var p1 = head, p2 = head, p3 = p1
        for _ in 0..<n {
            p2 = p2?.next
        }
        if p2 == nil {
            return head?.next
        }
        while p2 != nil {
            p3 = p1
            p1 = p1?.next
            p2 = p2?.next
        }
        p3?.next = p3?.next?.next
        return head
    }
}
//: [Next](@next)
