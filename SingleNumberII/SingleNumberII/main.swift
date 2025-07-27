//
//  main.swift
//  SingleNumberII
//
//  Created by Ilia Baudin on 21.07.2025.
//

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        
        var dict: [Int:Int] = [:]
        
        for eachNum in nums {
            
            if let extractedValue = dict[eachNum] {
                if extractedValue == 2 {
                    dict.removeValue(forKey: eachNum)
                } else {
                    dict[eachNum] = extractedValue + 1
                }
            } else {
                dict[eachNum] = 1
            }
            
            
        }
        
        guard let result = dict.first?.key else {
            return 0
        }
        
        return result
    }
}

var sol = Solution()
print(sol.singleNumber([2,2,3,2]))
print(sol.singleNumber([0,1,0,1,0,1,99]))



