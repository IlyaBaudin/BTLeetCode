//
//  main2.swift
//  MergeTwoSortedLists
//
//  Created by Ilia Baudin on 01.07.2025.
//

import Foundation

class IterativeSolution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var current = dummy

        var l1 = list1
        var l2 = list2

        while let node1 = l1, let node2 = l2 {
            if node1.val < node2.val {
                current.next = node1
                l1 = node1.next
            } else {
                current.next = node2
                l2 = node2.next
            }
            current = current.next!
        }

        current.next = l1 ?? l2

        return dummy.next
    }
}
