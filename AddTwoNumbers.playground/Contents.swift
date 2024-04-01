import Foundation

// * Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { 
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

extension ListNode {
    
    /// Represent `ListNode` value as a `String`
    /// - Returns: string representation for ListNode in human readable format
    internal func repStringValue() -> String {
        guard let next else { return String(val) }
        let nextValue = next.repStringValue()
        let currentValue = String(val)
        return nextValue + currentValue
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // save nodes into variables
        var node1 = l1
        var node2 = l2
        
        // create first result node (by reference will be changed in loop)
        var temp: ListNode? = ListNode(0)
        var current = temp
        // aggregation variable
        var carry = 0
        
        // go through all nodes
        while node1 != nil || node2 != nil || carry > 0 {
            
            var sum = 0
            
            // add to sum value from first node and `switch` node1 to next value
            if node1 != nil {
                sum += node1!.val
                node1 = node1?.next
            }
            
            // add to sum value from second node and `switch` node2 to next value
            if node2 != nil {
                sum += node2!.val
                node2 = node2?.next
            }
            
            // add to sum carry value (depends on sum result on previous step)
            sum += carry
            // calculate place number to save carry for next iteration
            carry = sum / 10
            // save value in list
            current?.next = ListNode(sum % 10)
            // rewrite current list with intermediate result
            current = current?.next
        }
        
        return temp?.next
    }
}

//[1,0,0,0,0,0,0,0,0,0,1]
let n10 = ListNode(1)
let n9 = ListNode(0, n10)
let n8 = ListNode(0, n9)
let n7 = ListNode(0, n8)
let n6 = ListNode(0, n7)
let n5 = ListNode(0, n6)
let n4 = ListNode(0, n5)
let n3 = ListNode(0, n4)
let n2 = ListNode(0, n3)
let n1 = ListNode(0, n2)
let n = ListNode(1, n1)

//[5,6,4]
let l2 = ListNode(4)
let l1 = ListNode(6, l2)
let l = ListNode(5, l1)

let s = Solution()
let result = s.addTwoNumbers(l, n)
result?.repStringValue()

