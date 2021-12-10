
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
        XCTAssertEqual(result, 26397)
    }
    
    func testDay10() {
        let input = FileLoader.loadContent(forResource: "day10").strings
        
        let result = SyntaxScoring.calculateSyntaxErrorScore(for: input)
        
        XCTAssertEqual(result, 321237)
    }
}
