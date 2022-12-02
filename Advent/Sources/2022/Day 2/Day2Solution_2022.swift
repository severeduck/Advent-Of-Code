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
    
    static func yourMoveFor(
        desiredOutcome: PRSGameResult,
        opponentsMove: RPSMove
    ) -> RPSMove {
        switch desiredOutcome {
        case .draw:
            return opponentsMove
        case .win:
            return RPSMove(playingScore: ((opponentsMove.playingScore % RPSMove.allCases.count) + 1))!
        case .lose:
            let addition = opponentsMove.playingScore - 1 == 0 ? RPSMove.allCases.count : 0
            return RPSMove(playingScore: (opponentsMove.playingScore - 1) + addition)!
        }
    }
    
    init(from line: String) {
        let components = line.split(separator: " ")
        let desiredOutcome = PRSGameResult(rawValue: String(components.last!))!
        opponentsMove = RPSMove(rawValue: String(components.first!))!
        yourMove = Self.yourMoveFor(desiredOutcome: desiredOutcome, opponentsMove: opponentsMove)
    }
    
    init(
        yourMove: RPSMove,
        opponentsMove: RPSMove
    ) {
        self.yourMove = yourMove
        self.opponentsMove = opponentsMove
    }

    var getYourScore: Int {
        var gameResultScore: Int
        
        if yourMove.playingScore == opponentsMove.playingScore {
            gameResultScore = PRSGameResult.draw.points
        } else if abs(yourMove.playingScore - opponentsMove.playingScore) == (RPSMove.allCases.count - 1) {
            gameResultScore = yourMove.playingScore > opponentsMove.playingScore ? PRSGameResult.lose.points : PRSGameResult.win.points
        } else {
            gameResultScore = (yourMove.playingScore - opponentsMove.playingScore > 0) ? PRSGameResult.win.points : PRSGameResult.lose.points
        }
        
        return gameResultScore + yourMove.playingScore
    }
}

enum RPSMove: String, RawRepresentable, CaseIterable {
    case rock = "A"
    case paper = "B"
    case scissors = "C"

    init?(playingScore: Int) {
        switch playingScore {
        case 1:
            self = .rock
        case 2:
            self = .paper
        case 3:
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

enum PRSGameResult: String, RawRepresentable {
    case win = "Z"
    case draw = "Y"
    case lose = "X"
    
    var points: Int {
        switch self {
        case .win:
            return 6
        case .draw:
            return 3
        case .lose:
            return 0
        }
    }
}
