
import Foundation

public struct LowPointsFinder {
    public static func findLowPointsSum(array: [[Int]]) -> Int {
        // TODO: Implement
        return 0
    }
    
    private static func findPositionsToVisit(
        forElementAt position: (Int, Int),
        in array: inout [[(Bool, Int)]]
    ) -> [(Int, Int)] {
        
        let adjacentElementPositions: [(Int, Int)] = [
            (position.0, position.1 + 1),
            (position.0, position.1 - 1),
            (position.0 + 1, position.1),
            (position.0 - 1, position.1)
        ]
            .filter { position in
                array[safe: position.0]?[safe: position.1]?.0 == false
            }
        
        return adjacentElementPositions
    }
}
