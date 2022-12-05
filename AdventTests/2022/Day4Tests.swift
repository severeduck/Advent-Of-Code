
import XCTest
@testable import Advent

public class Day4Tests2022: XCTestCase {
    
    private let inputFilename = "input_day4_2022"
    
    func testGetRepeatedItemPriority() {
        let fileContent = FileLoader.loadContent(forResource: inputFilename)
        let lines = fileContent.strings
        
        let result = Day4Solution_2022.countFullyOverlappingRanges(for: lines)
        
        XCTAssertEqual(result, 456)
    }
}

