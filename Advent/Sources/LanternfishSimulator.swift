
import Foundation

public struct LanternfishSimulator {
    public static func simulateSpawn(fishes: [Int], numberOfDays: Int) -> UInt {
        let maxFishLifespan = 8
        var population = Dictionary(
            uniqueKeysWithValues: zip(
                0...maxFishLifespan,
                Array(repeating: UInt(0), count: maxFishLifespan + 1)
            )
        )
        
        fishes.forEach {
            population[$0, default: 0] += 1
        }
        
        for _ in 0..<numberOfDays {
            let fishesToResetCount = UInt(population[0, default: 0])
            
            for key in 1...maxFishLifespan {
                let fishesCount = population[key]!
                population[key]! -= fishesCount
                population[key - 1]! += fishesCount
            }
            
            population[8]! += fishesToResetCount
            population[6]! += fishesToResetCount
            population[0]! -= fishesToResetCount
        }
        
        return population.values.reduce(0, +)
    }
}
