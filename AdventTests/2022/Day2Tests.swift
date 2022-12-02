
import XCTest
@testable import Advent

public class Day2Tests2022: XCTestCase {
    
    private let inputFilename = "input_day2_2022"
    
    func testGameLogic() {
        let rockVersusRock = RPSGame(yourMove: .rock, opponentsMove: .rock)
        let rockVersusPaper = RPSGame(yourMove: .rock, opponentsMove: .paper)
        let rockVersusScissors = RPSGame(yourMove: .rock, opponentsMove: .scissors)
        
        let paperVersusRock = RPSGame(yourMove: .paper, opponentsMove: .rock)
        let paperVersusPaper = RPSGame(yourMove: .paper, opponentsMove: .paper)
        let paperVersusScissors = RPSGame(yourMove: .paper, opponentsMove: .scissors)
        
        let scissorsVersusRock = RPSGame(yourMove: .scissors, opponentsMove: .rock)
        let scissorsVersusPaper = RPSGame(yourMove: .scissors, opponentsMove: .paper)
        let scissorsVersusScissors = RPSGame(yourMove: .scissors, opponentsMove: .scissors)

        XCTAssertEqual(rockVersusRock.getYourScore, 4)
        XCTAssertEqual(rockVersusPaper.getYourScore, 1)
        XCTAssertEqual(rockVersusScissors.getYourScore, 7)
        
        XCTAssertEqual(paperVersusRock.getYourScore, 8)
        XCTAssertEqual(paperVersusPaper.getYourScore, 5)
        XCTAssertEqual(paperVersusScissors.getYourScore, 2)
        
        XCTAssertEqual(scissorsVersusRock.getYourScore, 3)
        XCTAssertEqual(scissorsVersusPaper.getYourScore, 9)
        XCTAssertEqual(scissorsVersusScissors.getYourScore, 6)
    }
    
    func testYourMoveForDesiredOutcome() {
        XCTAssertEqual(RPSGame.yourMoveFor(desiredOutcome: .win, opponentsMove: .scissors), .rock)
        XCTAssertEqual(RPSGame.yourMoveFor(desiredOutcome: .draw, opponentsMove: .paper), .paper)
        XCTAssertEqual(RPSGame.yourMoveFor(desiredOutcome: .lose, opponentsMove: .rock), .scissors)
    }

    func testCalculateRockPaperScissorsScore() {
        let fileContent = FileLoader.loadContent(forResource: inputFilename)
        let lines = fileContent.strings
        
        let result = Day2Solution_2022.calculateRockPaperScissorsScore(for: lines)
        
        XCTAssertEqual(result, 13022)
    }
}

