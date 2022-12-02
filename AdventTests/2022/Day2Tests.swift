
import XCTest
@testable import Advent

public class Day2Tests2022: XCTestCase {
    
    private let inputFilename = "input_day2_2022"
    
    func testGameLogic() {
        let rockVersusRock = RPSGame(from: "A X")
        let rockVersusPaper = RPSGame(from: "A Y")
        let rockVersusScissors = RPSGame(from: "A Z")
        
        let paperVersusRock = RPSGame(from: "B X")
        let paperVersusPaper = RPSGame(from: "B Y")
        let paperVersusScissors = RPSGame(from: "B Z")
        
        let scissorsVersusRock = RPSGame(from: "C X")
        let scissorsVersusPaper = RPSGame(from: "C Y")
        let scissorsVersusScissors = RPSGame(from: "C Z")

        XCTAssertEqual(rockVersusRock.getYourScore, 4)
        XCTAssertEqual(rockVersusPaper.getYourScore, 8)
        XCTAssertEqual(rockVersusScissors.getYourScore, 3)
        
        XCTAssertEqual(paperVersusRock.getYourScore, 1)
        XCTAssertEqual(paperVersusPaper.getYourScore, 5)
        XCTAssertEqual(paperVersusScissors.getYourScore, 9)
        
        XCTAssertEqual(scissorsVersusRock.getYourScore, 7)
        XCTAssertEqual(scissorsVersusPaper.getYourScore, 2)
        XCTAssertEqual(scissorsVersusScissors.getYourScore, 6)
    }

    func testCalculateRockPaperScissorsScore() {
        let fileContent = FileLoader.loadContent(forResource: inputFilename)
        let lines = fileContent.strings
        
        let result = Day2Solution_2022.calculateRockPaperScissorsScore(for: lines)
        
        XCTAssertEqual(result, 11841)
    }
}

