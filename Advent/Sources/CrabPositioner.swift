
import Foundation

public struct CrabPositioner {
    public static func findLeastFuelPossible(
        for positions: [Int]
    ) -> Int {
        let destinations = positions.min()!...positions.max()!
        
        var travelCosts = [Int](repeating: 0, count: destinations.count)
        positions.indices.forEach { originIndex in
            let origin = positions[originIndex]

            destinations.forEach { destination in
                let travelDistance = abs(destination - origin)
                travelCosts[destination] += (travelDistance) * (travelDistance + 1) / 2
            }
        }
        
        return travelCosts.min()!
    }
}
