
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
    func representValue() -> Int {
        if let next = next {
            return Int("\(next.representValue())\(val)") ?? 0
        } else {
            return val
        }
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let node1 = l1, let node2 = l2 else { return nil }
        
        var node1Value = node1.representValue()
        var node2Value = node2.representValue()
        
        var node1ValueStr = String(node1Value)
        var node2ValueStr = String(node2Value)
        
        let difference = node1ValueStr.count - node2ValueStr.count
        if difference < 0 {
            let diffStr = String(repeating: "0", count: -difference)
            node2ValueStr = node2ValueStr + diffStr
        } else if difference > 0 {
            let diffStr = String(repeating: "0", count: difference)
            node1ValueStr = node1ValueStr + diffStr
        }
        
        node1Value = Int(node1ValueStr) ?? 0
        node2Value = Int(node2ValueStr) ?? 0
        
        
        let sum = node1Value + node2Value
        let sumStr = String(sum)
        
        var lastNode: ListNode?
        for eachItem in sumStr {
            let intVal = Int(String(eachItem)) ?? 0
            
            if lastNode == nil {
                lastNode = ListNode(intVal)
            } else {
                let newLastNode = ListNode(intVal, lastNode)
                lastNode = newLastNode
            }
            
            print(eachItem)
        }
        return lastNode
    }
}

let n3 = ListNode(3)
let n2 = ListNode(4, n3)
let n1 = ListNode(2, n2)


let l3 = ListNode(4)
let l2 = ListNode(6, l3)
let l1 = ListNode(5, l2)

let s = Solution()
s.addTwoNumbers(n1, l1)

