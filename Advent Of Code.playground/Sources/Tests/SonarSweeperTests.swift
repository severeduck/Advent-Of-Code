
import XCTest

public class SonarSweeperTests: XCTestCase {

    func testIncreasedDepthsCount() {
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: []), 0)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [0]), 0)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [0, 1]), 1)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [1, 0]), 0)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [0, 0]), 0)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [0, 1, 2, 3]), 3)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [3, 2, 1, 0]), 0)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [0, 2, 1]), 1)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [0, 1, 2, 0, 1, 2, 0, 1, 2]), 6)
    }
    
    func testIncreasedDepthsCountFor3MeasurementsSlidingWindow() {
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [], slidingWindowSize: 3), 0)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [0], slidingWindowSize: 3), 0)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [0, 1], slidingWindowSize: 3), 0)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [1, 0], slidingWindowSize: 3), 0)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [0, 0], slidingWindowSize: 3), 0)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [0, 1, 2, 3], slidingWindowSize: 3), 1)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [3, 2, 1, 0], slidingWindowSize: 3), 0)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [0, 2, 1], slidingWindowSize: 3), 0)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [0, 1, 2, 0, 1, 2, 0, 1, 2], slidingWindowSize: 3), 0)
        XCTAssertEqual(SonarSweeper.countIncreasedDepths(in: [0, 1, 2, 3, 0, 1, 2, 3, 0], slidingWindowSize: 3), 2)
    }
}

