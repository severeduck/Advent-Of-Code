//
//  Day1Part1Solution_2022.swift
//  Advent
//
//  Created by Yakiv Kovalskyi on 02.12.2022.
//

import Foundation

struct Day1Part1Solution_2022 {
    
    static func findTotalCalories(for lines: [String]) -> Int {
        var maxTotal = 0
        var currentTotal = 0
                
        for line in lines {
            if let integerValue = Int(line) {
                currentTotal += integerValue
            } else {
                if currentTotal > maxTotal {
                    maxTotal = currentTotal
                }
                
                currentTotal = 0
            }
        }
        
        return max(maxTotal, currentTotal)
    }
}
