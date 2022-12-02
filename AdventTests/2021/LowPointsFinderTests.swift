
import XCTest
@testable import Advent

public class LowPointsFinderTests: XCTestCase {
    func testSampleInput() {
        let array =
"""
2199943210
3987894921
9856789892
8767896789
9899965678
""".digitsAsInts

        let sum = LowPointsFinder.findLowPointsSum(array: array)
        XCTAssertEqual(sum, 15)
    }
    
    func testDay9() {
        let array = FileLoader.loadContent(forResource: "day9").digitsAsInts
        
        let sum = LowPointsFinder.findLowPointsSum(array: array)
        
        XCTAssertEqual(sum, 564)
    }
}

