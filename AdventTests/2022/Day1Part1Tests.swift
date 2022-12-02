
import XCTest
@testable import Advent

public class Day1Part1Tests2022: XCTestCase {

    func testFindMaxTotalValue() {
        let fileContent = FileLoader.loadContent(forResource: "day1_part1_2022_input")
        let lines = fileContent.stringsIncludingEmptySubsequences
        
        let result = Day1Part1Solution_2022.findTotalCalories(for: lines)
        
        XCTAssertEqual(result, 71471)
    }
}

