//
//  main.swift
//  MergeTwoSortedLists
//
//  Created by Ilia Baudin on 01.07.2025.
//

import Foundation

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

extension ListNode: CustomStringConvertible {
    public var description: String {
        var result: [Int] = []
        var current: ListNode? = self
        while let node = current {
            result.append(node.val)
            current = node.next
        }
        return result.map(String.init).joined(separator: " -> ")
    }
}

class Solution {
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // If first list is empty, return second one
        if list1 == nil {
            return list2
        }
        // If second list is empty, return first one
        if list2 == nil {
            return list1
        }
        
        // Compare the values and build the list recursively
        if list1!.val < list2!.val {
            list1!.next = mergeTwoLists(list1!.next, list2)
            return list1
        } else {
            list2!.next = mergeTwoLists(list1, list2!.next)
            return list2
        }
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
print(result?.description ?? "")


