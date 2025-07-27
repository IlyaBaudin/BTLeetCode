/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    
    var resultList: ListNode?
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil && list2 == nil {
            return resultList
        }
        
        if list1 != nil && list2 != nil {
            let list1Value = list1!.val
            let list2Value = list2!.val
            
            if list1Value < list2Value {
                resultList = ListNode(list1Value)
                resultList?.next = mergeTwoLists(list1!.next, list2!)
            } else {
                resultList = ListNode(list2Value)
                resultList?.next = mergeTwoLists(list1!, list2!.next)
            }
        }
        
        if list1 == nil {
            resultList?.next = mergeTwoLists(resultList, list2?.next)
        }
        
        if list2 == nil {
            resultList?.next = mergeTwoLists(resultList, list1?.next)
        }
        
        return nil
    }
}

let list1_1 = ListNode(1)
let list1_2 = ListNode(2)
let list1_3 = ListNode(4)
list1_1.next = list1_2
list1_2.next = list1_3

let list2_1 = ListNode(1)
let list2_2 = ListNode(3)
let list2_3 = ListNode(4)
list2_1.next = list2_2
list2_2.next = list2_3

let solution = Solution()
let result = solution.mergeTwoLists(list1_1, list2_1)
print(result)
