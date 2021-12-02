
import Foundation


FileLoaderTests.defaultTestSuite.run()
SubmarineTests.defaultTestSuite.run()

let depthLevels = FileLoader.loadContent(forResource: "day1").ints

// day 1, part 1
Submarine.countIncreasedDepths(in: depthLevels)

// day 1, part 2
Submarine.countIncreasedDepths(in: depthLevels, slidingWindowSize: 3)

// day 2
let steps = FileLoader.loadContent(forResource: "day2").steps
let position = Submarine.findFinalPosition(for: steps)

print(position.horizontal * position.depth)
