/*:
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
     Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
     Output: 7 -> 0 -> 8
 */


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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var n1:ListNode? = l1,n2:ListNode? = l2
        
        var value = n1!.val + n2!.val
        
        var result:ListNode = ListNode(n1!.val + n2!.val)
        var cursor = result
        var over = false
        
        if value >= 10 {
            result.val = value - 10
            over = true
        }
        
        while let next1 = n1?.next {
            guard let next2 = n2?.next else {
                return nil
            }

            var value = next1.val + next2.val
            if over {
                value = value + 1
                over = false
            }
            
            if value >= 10 {
                cursor.next = ListNode(value - 10)
                over = true
            } else {
                cursor.next = ListNode(value)
            }
        
            cursor = result.next!

            n1 = next1
            n2 = next2
        }
        
        if over {
            cursor.next = ListNode(1)
        }
        
        return result
        
    }
}

let node1 = ListNode(1)
node1.next = ListNode(8)
//node1.next?.next = ListNode(3)

let node2 = ListNode(0)
//node2.next = ListNode(6)
//node2.next?.next = ListNode(4)

var solution = Solution().addTwoNumbers(node1, node2)

while solution != nil {

    print(solution!.val)
    
    solution = solution?.next
}

//: [Next](@next)
