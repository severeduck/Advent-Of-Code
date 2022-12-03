
import XCTest
@testable import Advent

public class Day3Tests2022: XCTestCase {
    
    private let inputFilename = "input_day3_2022"
    
    func testGetRepeatedItemPriority() {
        let fileContent = FileLoader.loadContent(forResource: inputFilename)
        let lines = fileContent.strings
        var result = 0
        
        for index in stride(from: 0, to: lines.count, by: 3) {
            result += Day3Solution_2022.getCommonItemPriority(for: Array(lines[index..<(index + 3)]))
        }
        
        XCTAssertEqual(result, 2760)
    }
}

