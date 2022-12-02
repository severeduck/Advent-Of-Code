
import XCTest
@testable import Advent

public class CrabPositionerTests: XCTestCase {
    func testSampleInput() {
        let input = [16,1,2,0,4,2,7,1,2,14]
        
        let result = CrabPositioner.findLeastFuelPossible(for: input)
        
        XCTAssertEqual(result, 168)
    }
    
    func testDay7() {
        let testFile = FileLoader.loadContent(forResource: "day7")
        
        let result = CrabPositioner.findLeastFuelPossible(for: testFile.commaSeparatedInts)
        
        XCTAssertEqual(result, 102245489)
    }
}

