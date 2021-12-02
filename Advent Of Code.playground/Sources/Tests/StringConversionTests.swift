
import XCTest

public class StringConversionTests: XCTestCase {

    func testConversion() {
        let steps =
"""
up 2
up 6
forward 7
""".steps
        XCTAssertEqual(steps.count, 3)
        XCTAssertEqual(steps[0].direction, .up)
        XCTAssertEqual(steps[1].direction, .up)
        XCTAssertEqual(steps[2].direction, .forward)
        XCTAssertEqual(steps[0].distance, 2)
        XCTAssertEqual(steps[1].distance, 6)
        XCTAssertEqual(steps[2].distance, 7)
    }
}

