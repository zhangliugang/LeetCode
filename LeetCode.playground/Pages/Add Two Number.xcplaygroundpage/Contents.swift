/*:
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
     Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
     Output: 7 -> 0 -> 8
 */


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
    func next(_ l1: ListNode?, _ l2: ListNode?) -> Int?{
        if let node1 = l1 {
            if let node2 = l2 {
                return node1.val + node2.val
            } else {
                return node1.val
            }
        } else {
            if let node2 = l2 {
                return node2.val
            } else {
                return nil
            }
        }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        let value = l1!.val + l2!.val
        
        let result = ListNode(value)
        
        var cursor: ListNode? = result
        var over = false
        
        if value >= 10 {
            result.val = value - 10
            over = true
        }
        
        var n1 = l1?.next
        var n2 = l2?.next
        
        while let nv = next(n1, n2) {
            let value = over ? nv + 1 : nv
            if value >= 10 {
                cursor?.next = ListNode(value - 10)
                over = true
            } else {
                cursor?.next = ListNode(value)
                over = false
            }
            n1 = n1?.next
            n2 = n2?.next
            cursor = cursor?.next
        }
        
        if over {
            cursor?.next = ListNode(1)
        }
        
        return result
    }
}

let node1 = ListNode(9)
node1.next = ListNode(9)
node1.next!.next = ListNode(9)
node1.next!.next?.next = ListNode(9)
node1.next!.next?.next?.next = ListNode(9)

let node2 = ListNode(1)
node2.next = ListNode(6)
node2.next!.next = ListNode(4)

var solution = Solution().addTwoNumbers(node1, node2)
//
while solution != nil {

    print(solution!.val)

    solution = solution?.next
}

//: [Next](@next)
