
import XCTest
@testable import Advent

class SyntaxScoringTests: XCTestCase {
    func testSampleInput() {
        let input =
        """
[({(<(())[]>[[{[]{<()<>>
[(()[<>])]({[<{<<[]>>(
{([(<{}[<>[]}>{[]{[(<()>
(((({<>}<{<{<>}{[]{[]{}
[[<[([]))<([[{}[[()]]]
[{[{({}]{}}([{[{{{}}([]
{<[[]]>}<{[{[{[]{()[[[]
[<(<(<(<{}))><([]([]()
<{([([[(<>()){}]>(<<{{
<{([{{}}[<[[[<>{}]]]>[]]
""".strings
        let result = SyntaxScoring.calculateSyntaxErrorScore(for: input)
        XCTAssertEqual(result, 288957)
    }
    
    func testDay10() {
        let input = FileLoader.loadContent(forResource: "day10").strings
        
        let result = SyntaxScoring.calculateSyntaxErrorScore(for: input)
        
        XCTAssertEqual(result, 2360030859)
    }
}
