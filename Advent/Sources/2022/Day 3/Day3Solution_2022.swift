//
//  Day1Solution_2022.swift
//  Advent
//
//  Created by Yakiv Kovalskyi on 02.12.2022.
//

import Foundation

struct Day3Solution_2022 {
    
    static func getCommonItemPriority(
        for lines: [String]
    ) -> Int {
        let commonCharacter = Set(lines[0])
            .intersection(Set(lines[1]))
            .intersection(Set(lines[2]))
            .first!
        
        return characterPriorities[String(commonCharacter)]!
    }
    
    static var characterPriorities: [String: Int] = {
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
            .enumerated()
            .reduce(into: [:])
        { partialResult, char in
            partialResult[String(char.element)] = char.offset + 1
        }
    }()
}
