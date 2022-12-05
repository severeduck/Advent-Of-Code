//
//  Day1Solution_2022.swift
//  Advent
//
//  Created by Yakiv Kovalskyi on 02.12.2022.
//

import Foundation

struct Day4Solution_2022 {
    
    static func countFullyOverlappingRanges(
        for lines: [String]
    ) -> Int {
        lines.reduce(0) { partialResult, line in
            partialResult + (Self.hasFullyOverlappingRanges(line: line) ? 1 : 0)
        }
    }
    
    private static func hasFullyOverlappingRanges(
        line: String
    ) -> Bool {
        let lineComponents = line.split(separator: ",")
        let range1Components = lineComponents.first!
        let range2Components = lineComponents.last!
        let range1Parts = range1Components.split(separator: "-")
        let range2Parts = range2Components.split(separator: "-")
        let range1 = Int(range1Parts.first!)!...Int(range1Parts.last!)!
        let range2 = Int(range2Parts.first!)!...Int(range2Parts.last!)!
        return range1.overlaps(range2) || range2.overlaps(range1)
    }
}
