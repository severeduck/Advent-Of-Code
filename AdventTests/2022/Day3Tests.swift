
import XCTest
@testable import Advent

public class Day3Tests2022: XCTestCase {
    
    private let inputFilename = "input_day3_2022"
    
    func testGetRepeatedItemPriority() {
        let fileContent = FileLoader.loadContent(forResource: inputFilename)
        let lines = fileContent.strings
        
        let result = lines.reduce(0) { partialResult, line in
            partialResult + Day3Solution_2022.getRepeatedItemPriority(for: line)
        }
        
        XCTAssertEqual(result, 7578)
    }
}

