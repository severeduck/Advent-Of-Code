
import XCTest
@testable import Advent

public class Day1Tests2022: XCTestCase {
    
    private let inputFilename = "day1_2022_input"

    func testFindMaxTotalValue() {
        let fileContent = FileLoader.loadContent(forResource: inputFilename)
        let lines = fileContent.stringsIncludingEmptySubsequences
        
        let result = Day1Solution_2022.findMaxTotalCalories(for: lines)
        
        XCTAssertEqual(result, 71471)
    }
    
    func testFindTop3MaxTotalValues() {
        let fileContent = FileLoader.loadContent(forResource: inputFilename)
        let lines = fileContent.stringsIncludingEmptySubsequences
        
        let result = Day1Solution_2022.findMaxTotalCalories(for: lines, topListCount: 3)
        
        XCTAssertEqual(result, 211189)
    }
}

