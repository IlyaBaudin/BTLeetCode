//
//  main.swift
//  SingleNumber
//
//  Created by Ilia Baudin on 21.07.2025.
//

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        
        var map: Set<Int> = []
        
        for eachNum in nums {
            if !map.contains(eachNum) {
                map.insert(eachNum)
            } else {
                map.remove(eachNum)
            }
        }
        
        guard let result = map.first else {
            return 0
        }
        
        return result
    }
}

var sol = Solution()
print(sol.singleNumber([2,2,1]))
print(sol.singleNumber([4,1,2,1,2]))
print(sol.singleNumber([1]))

