
import Foundation


FileLoaderTests.defaultTestSuite.run()
SonarSweeperTests.defaultTestSuite.run()

let numbers = FileLoader.loadContent().ints

SonarSweeper.countIncreasedDepths(in: numbers)
SonarSweeper.countIncreasedDepths(in: numbers, slidingWindowSize: 3)
