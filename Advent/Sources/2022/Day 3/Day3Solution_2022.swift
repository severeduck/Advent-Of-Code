//
//  Day1Solution_2022.swift
//  Advent
//
//  Created by Yakiv Kovalskyi on 02.12.2022.
//

import Foundation

struct Day3Solution_2022 {
    
    static func getRepeatedItemPriority(
        for line: String
    ) -> Int {
        let leftsideCharacters = Set(line[0..<line.count / 2])
        let rightsideCharacters = Set(line[(line.count / 2)...])
        let repeatedCharacter = leftsideCharacters.intersection(rightsideCharacters).first!
        
        return characterPriorities[String(repeatedCharacter)]!
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
