
import Foundation

public struct Bingo {
    public static func play(gameContent: [String]) {
        let loadedGame = prepareGame(gameContent: gameContent)
        var ballsSequence = loadedGame.0
        var tickets = loadedGame.1
        
        var winner: [[(Int, Bool)]]?
        var ballPlayed = 0
        while !ballsSequence.isEmpty {
            ballPlayed = ballsSequence.removeFirst()

            for index in tickets.indices {
                mark(number: ballPlayed, in: &tickets[index])
            }
            
            for _ in tickets {
                if let winnerIndex = tickets.firstIndex(where: { isWinner(ticket: $0) }) {
                    winner = tickets[winnerIndex]
                    print("calculateScore: \(calculateScore(ticket: winner!, ball: ballPlayed))")
                    tickets.remove(at: winnerIndex)
                }
            }
        }
    }
    
    private static func prepareGame(gameContent: [String]) -> ([Int], [[[(Int, Bool)]]]) {
        var fullContent = gameContent
        let ballsSequence = fullContent
            .removeFirst()
            .split(separator: ",")
            .compactMap { Int($0) }
        
        var allTicketLines: [[(Int, Bool)]] = fullContent
            .map { $0
                .split(separator: " ")
                .compactMap { (Int($0)!, false) }
            }
        
        let ticketRowsCount = allTicketLines[0].count
        var allTickets = [[[(Int, Bool)]]]()
        while !allTicketLines.isEmpty {
            let ticket = Array(allTicketLines.prefix(ticketRowsCount))
            allTickets.append(ticket)
            allTicketLines.removeFirst(ticketRowsCount)
        }
        
        return (ballsSequence, allTickets)
    }
    
    private static func mark(number: Int, in ticket: inout [[(Int, Bool)]]) {
        let sideSize = ticket[0].count

        for rowIndex in 0..<sideSize {
            for columnIndex in 0..<sideSize {
                if number == ticket[rowIndex][columnIndex].0 {
                    ticket[rowIndex][columnIndex].1 = true
                }
            }
        }
    }
    
    private static func isWinner(ticket: [[(Int, Bool)]]) -> Bool {
        let sideSize = ticket[0].count
        
        for index in 0..<sideSize {
            let row = ticket[index]
            let isWinningRow = row.allSatisfy { $0.1 }
            if isWinningRow { return true }
            
            let column = ticket.map { $0[index] }
            let isWinningColumn = column.allSatisfy { $0.1 }
            if isWinningColumn { return true }
        }
        
        return false
    }
    
    private static func calculateScore(ticket: [[(Int, Bool)]], ball: Int) -> Int {
        let unmarkedNumbersSum = ticket.reduce(0) { partialResult, row in
            partialResult + row.reduce(0, { partialResult, square in
                partialResult + (square.1 ? 0 : square.0)
            })
        }
        return unmarkedNumbersSum * ball
    }
}
