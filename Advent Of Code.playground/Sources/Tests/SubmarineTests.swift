
import XCTest

public class SubmarineTests: XCTestCase {

    func testIncreasedDepthsCount() {
        XCTAssertEqual(Submarine.countIncreasedDepths(in: []), 0)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [0]), 0)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [0, 1]), 1)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [1, 0]), 0)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [0, 0]), 0)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [0, 1, 2, 3]), 3)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [3, 2, 1, 0]), 0)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [0, 2, 1]), 1)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [0, 1, 2, 0, 1, 2, 0, 1, 2]), 6)
    }
    
    func testIncreasedDepthsCountFor3MeasurementsSlidingWindow() {
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [], slidingWindowSize: 3), 0)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [0], slidingWindowSize: 3), 0)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [0, 1], slidingWindowSize: 3), 0)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [1, 0], slidingWindowSize: 3), 0)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [0, 0], slidingWindowSize: 3), 0)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [0, 1, 2, 3], slidingWindowSize: 3), 1)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [3, 2, 1, 0], slidingWindowSize: 3), 0)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [0, 2, 1], slidingWindowSize: 3), 0)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [0, 1, 2, 0, 1, 2, 0, 1, 2], slidingWindowSize: 3), 0)
        XCTAssertEqual(Submarine.countIncreasedDepths(in: [0, 1, 2, 3, 0, 1, 2, 3, 0], slidingWindowSize: 3), 2)
    }
    
    func testNavigation() {
        XCTAssertEqual(
            Submarine.findFinalPosition(for: [Step(direction: .forward, distance: 0)]),
            Position(horizontal: 0, depth: 0)
        )
        XCTAssertEqual(
            Submarine.findFinalPosition(for: [Step(direction: .forward, distance: 1)]),
            Position(horizontal: 1, depth: 0)
        )
        XCTAssertEqual(
            Submarine.findFinalPosition(for: [Step(direction: .down, distance: 1)]),
            Position(horizontal: 0, depth: 0, aim: 1)
        )
        XCTAssertEqual(
            Submarine.findFinalPosition(for: [Step(direction: .up, distance: 1)]),
            Position(horizontal: 0, depth: 0, aim: -1)
        )
        XCTAssertEqual(
            Submarine.findFinalPosition(for: [
                Step(direction: .down, distance: 5),
                Step(direction: .forward, distance: 4),
                Step(direction: .up, distance: 3)
            ]),
            Position(horizontal: 4, depth: 20, aim: 2)
        )
        XCTAssertEqual(
            Submarine.findFinalPosition(for: [
                Step(direction: .forward, distance: 5),
                Step(direction: .down, distance: 5),
                Step(direction: .forward, distance: 8),
                Step(direction: .up, distance: 3),
                Step(direction: .down, distance: 8),
                Step(direction: .forward, distance: 2)
            ]),
            Position(horizontal: 15, depth: 60, aim: 10)
        )
    }
}

