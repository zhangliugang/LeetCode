//: [Previous](@previous)

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reorderList(_ head: ListNode?) {
        var fast = head, slow = head
        while fast?.next != nil, fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        var left = head
        var right = reverse(slow?.next)
        slow?.next = nil
        
        printnode(left)
        print("\n")
        printnode(right)
        
        while left != nil && right != nil {
            let next_l = left?.next
            let next_r = right?.next
            left?.next = right
            right?.next = next_l
            
            left = next_l
            right = next_r
        }
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
    
    func printnode(_ head: ListNode?) {
        var p = head
        while p != nil {
            print(p!.val)
            p = p?.next
        }
    }
}

var list: ListNode? = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6))))))
Solution().reorderList(list)
print("\n")
Solution().printnode(list)
//: [Next](@next)
