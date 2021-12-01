
import Foundation

public struct SonarSweeper {
    public static func countIncreasedDepths(
        in array: [Int],
        slidingWindowSize: Int = 1
    ) -> Int {
        
        var currentIndexes = Array(0..<slidingWindowSize)
        var nextIndexes = currentIndexes.map { $0 + 1 }

        var increasedSumsCount = 0
        
        while nextIndexes.allSatisfy({ $0 < array.count }) {
            if nextIndexes.reduce(0, { $0 + array[$1] }) > currentIndexes.reduce(0, { $0 + array[$1] }) {
                increasedSumsCount += 1
            }
                        
            for i in currentIndexes.indices { currentIndexes[i] += 1 }
            for i in nextIndexes.indices { nextIndexes[i] += 1 }
        }
        
        return increasedSumsCount
    }
}
