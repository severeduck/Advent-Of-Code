
import XCTest
@testable import Advent

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
    
    func testCalculatePowerConsumption() {
        let input = """
00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010
"""
        let result = Submarine.calculatePowerConsumption(report: input.uint16s)
        print(result)
        XCTAssertEqual(result.epsilonRate, 9)
        XCTAssertEqual(result.gammaRate, 22)
    }
    
    func testDay3() {
        let report = FileLoader.loadContent(forResource: "day3").uint16s
        let rates = Submarine.calculatePowerConsumption(report: report)

    }
    
    func testCountHydrothermalVents() {
        let input = """
0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2
"""
        let lines = input.lines
        let sum = Submarine.countHydrothermalVents(lines: lines)
        XCTAssertEqual(sum, 12)
    }
    
    func testDay5() {
        let lines = FileLoader.loadContent(forResource: "day5").lines
        let sum = Submarine.countHydrothermalVents(lines: lines)
        XCTAssertEqual(sum, 18065)
    }
}

