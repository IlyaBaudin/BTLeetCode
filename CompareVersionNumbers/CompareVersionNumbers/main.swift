//
//  main.swift
//  CompareVersionNumbers
//
//  Created by Ilia Baudin on 15.07.2025.
//

import Foundation

func compareVersion(_ version1: String, _ version2: String) -> Int {
    
    var splitVersion1 = version1.split(separator: ".").map { substr in
        let trimmedSubstr = substr.drop(while: { $0 == "0" })
        return trimmedSubstr.isEmpty ? "0" : String(trimmedSubstr)
    }
    
    var splitVersion2 = version2.split(separator: ".").map{ substr in
        let trimmedSubstr = substr.drop(while: { $0 == "0" })
        return trimmedSubstr.isEmpty ? "0" : String(trimmedSubstr)
    }
    
    if splitVersion1.count > splitVersion2.count {
        splitVersion2.append(contentsOf: Array(repeating: "0", count: splitVersion1.count - splitVersion2.count))
    } else if splitVersion1.count < splitVersion2.count {
        splitVersion1.append(contentsOf: Array(repeating: "0", count: splitVersion2.count - splitVersion1.count))
    }
    
    for i in 0..<splitVersion1.count {
        
        let number1 = Int(splitVersion1[i]) ?? 0
        let number2 = Int(splitVersion2[i]) ?? 0
        
        if number1 > number2 {
            return 1
        } else if number1 < number2 {
            return -1
        } else {
            continue
        }
    }
    
    return 0
}



let res1 = compareVersion("1.2", "1.10")
print(res1)
let res2 = compareVersion("1.01", "1.001")
print(res2)
let res3 = compareVersion("1.0", "1.0.0.0")
print(res3)

let res4 = compareVersion("1.0.1", "1")
print(res4)

