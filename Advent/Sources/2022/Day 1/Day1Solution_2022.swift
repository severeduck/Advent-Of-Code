//
//  Day1Solution_2022.swift
//  Advent
//
//  Created by Yakiv Kovalskyi on 02.12.2022.
//

import Foundation

struct Day1Solution_2022 {
    
    static func findMaxTotalCalories(
        for lines: [String],
        topListCount: Int = 1
    ) -> Int {
        var maxTotals = Array(repeating: 0, count: topListCount)
        var currentTotal = 0
                
        for line in lines + [""] {
            if let integerValue = Int(line) {
                currentTotal += integerValue
            } else {
                if let smallestElementIndex = maxTotals
                    .enumerated()
                    .min (by: { $0.element < $1.element })?
                    .offset,
                   maxTotals[smallestElementIndex] < currentTotal
                {
                    maxTotals[smallestElementIndex] = currentTotal
                }
                    
                currentTotal = 0
            }
        }

        return maxTotals.reduce(0, +)
    }
}
