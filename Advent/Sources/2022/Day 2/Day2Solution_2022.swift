//
//  Day1Solution_2022.swift
//  Advent
//
//  Created by Yakiv Kovalskyi on 02.12.2022.
//

import Foundation

struct Day2Solution_2022 {
    
    static func calculateRockPaperScissorsScore(
        for lines: [String]
    ) -> Int {
        lines.reduce(0) { partialResult, line in
            let game = RPSGame(from: line)
            return partialResult + game.getYourScore
        }
    }
}

struct RPSGame {
    private let yourMove: RPSMove
    private let opponentsMove: RPSMove
    
    init(from line: String) {
        let components = line.split(separator: " ")
        yourMove = RPSMove(rawValue: String(components.last!))!
        opponentsMove = RPSMove(rawValue: String(components.first!))!
    }

    var getYourScore: Int {
        var gameResultScore: Int
        
        if yourMove.playingScore == opponentsMove.playingScore {
            gameResultScore = 3
        } else if abs(yourMove.playingScore - opponentsMove.playingScore) == (RPSMove.allCases.count - 1) {
            gameResultScore = yourMove.playingScore > opponentsMove.playingScore ? 0 : 6
        } else {
            gameResultScore = (yourMove.playingScore - opponentsMove.playingScore > 0) ? 6 : 0
        }
        
        return gameResultScore + yourMove.playingScore
    }
}

enum RPSMove: String, RawRepresentable, CaseIterable {
    case rock
    case paper
    case scissors
    
    init?(rawValue: String) {
        switch rawValue {
        case "A", "X":
            self = .rock
        case "B", "Y":
            self = .paper
        case "C", "Z":
            self = .scissors
        default:
            return nil
        }
    }
    
    var playingScore: Int {
        switch self {
        case .rock:
            return 1
        case .paper:
            return 2
        case .scissors:
            return 3
        }
    }
}
