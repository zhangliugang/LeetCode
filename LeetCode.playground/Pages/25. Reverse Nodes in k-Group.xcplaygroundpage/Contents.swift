//: [Previous](@previous)

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int, next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var n = 0
        var p1 = head, p2 = head, p3 = p2
        var ans: ListNode? = nil, last: ListNode? = nil
        while p1 != nil && p2 != nil {
            p3 = p2
            p2 = p2?.next
            n += 1
            if n == k {
                ans = p3
            }
            if n % k == 0 {
                p3?.next = nil
                if n == k {
                    ans = reverse(p1)
                } else {
                    last?.next = reverse(p1)
                }
                last = p1
                p1 = p2
            }
        }
        last?.next = p1
        return ans
    }
    
    func reverse(_ head: ListNode?) -> ListNode? {
        var p1 = head
        var p2: ListNode? = nil
        var p3: ListNode? = nil
        while p1 != nil {
            p3 = p1?.next
            p1?.next = p2
            p2 = p1
            p1 = p3
        }
        return p2
    }
}

var node = ListNode(1, next: ListNode(2, next: ListNode(3, next: ListNode(4, next: ListNode(5)))))
var p = Solution().reverseKGroup(node, 5)

while p != nil {
    print(p!.val)
    p = p?.next
}


//: [Next](@next)
