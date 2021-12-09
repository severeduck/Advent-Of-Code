
import XCTest
@testable import Advent

public class SevenSegmentSearchTests: XCTestCase {
    func testSampleInput() {
        let data =
"""
acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf
""".digitalDisplayData[0]
        let sum = SevenSegmentSearch.decodedOutputSum(input: data.0, output: data.1)
        XCTAssertEqual(5353, sum)
    }
    
    func testDay8() {
        var sum = 0
        
        let data = FileLoader.loadContent(forResource: "day8").digitalDisplayData
        data.forEach {
            sum += SevenSegmentSearch.decodedOutputSum(input: $0.0, output: $0.1)
            print(sum)
        }
        
        XCTAssertEqual(sum, 1019355)
    }
}

