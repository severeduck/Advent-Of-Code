
import XCTest
@testable import Advent

public class LanternfishSimulatorTests: XCTestCase {
    func testSimulateSpawn() {
        let fishes = [3, 4, 3, 1, 2]

        let result1 = LanternfishSimulator.simulateSpawn(fishes: fishes, numberOfDays: 18)
        let result2 = LanternfishSimulator.simulateSpawn(fishes: fishes, numberOfDays: 80)
        let result3 = LanternfishSimulator.simulateSpawn(fishes: fishes, numberOfDays: 256)

        XCTAssertEqual(result1, 26)
        XCTAssertEqual(result2, 5934)
        XCTAssertEqual(result3, 26984457539)
    }
    
    func testDay6() {
        let testFile = FileLoader.loadContent(forResource: "day6")
        let fishes = testFile.commaSeparatedInts
        
        let result1 = LanternfishSimulator.simulateSpawn(fishes: fishes, numberOfDays: 80)
        let result2 = LanternfishSimulator.simulateSpawn(fishes: fishes, numberOfDays: 256)

        XCTAssertEqual(result1, 394994)
        XCTAssertEqual(result2, 1765974267455)

    }
}

