
import Foundation

public struct Submarine {
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
    
    public static func findFinalPosition(for steps: [Step]) -> Position {
        var position = Position()

        steps.forEach {
            switch $0.direction {
            case .up:
                position.aim -= $0.distance
            case .down:
                position.aim += $0.distance
            case .forward:
                position.horizontal += $0.distance
                position.depth += position.aim * $0.distance
            }
        }
        
        return position
    }
    
    public static func getSubmarineStatus(report: [UInt16]) -> SubmarineStatus {
        var frequencies = [Int](repeating: 0, count: 16)
        for reportEntry in report {
            var mask = UInt16(1)
            for currentBitIndex in stride(from: frequencies.count - 1, to: -1, by: -1) {
                let isBitSet = (reportEntry & mask) > 0
                
                if isBitSet {
                    frequencies[currentBitIndex] += 1
                }
                
                mask = mask << 1
            }
        }

        frequencies = Array(frequencies.drop(while: { $0 == 0 }))

        var gammaRate: UInt16 = 0
        var epsilonRate: UInt16 = 0
        var mask = UInt16(1)
        for currentBitIndex in stride(from: frequencies.count - 1, to: -1, by: -1) {
            let shouldSetBit = frequencies[currentBitIndex] > (report.count / 2)

            if shouldSetBit {
                gammaRate |= mask
            } else {
                epsilonRate |= mask
            }
            
            mask = mask << 1
        }
        
        let oxygenRate = search(report: report, query: .findMoreOrEqual)
        let co2Rate = search(report: report, query: .findLessOrEqual)
        
        return SubmarineStatus(
            gammaRate: Int(gammaRate),
            epsilonRate: Int(epsilonRate),
            oxygenRate: Int(oxygenRate),
            co2Rate: Int(co2Rate)
        )
    }

    public static func countHydrothermalVents(lines: [Line]) -> Int {
        var pointsMap = [Point: Int]()
        lines.forEach {
            let pointsCovered = $0.coveredPoints
            pointsCovered.forEach {
                pointsMap[$0, default: 0] += 1
            }
        }
        debugPointsMap(pointsMap)
        return pointsMap.reduce(0) { partialResult, element in
            partialResult + (element.value >= 2 ? 1 : 0)
        }
    }
    
    private static func debugPointsMap(_ pointsMap: [Point: Int]) {
        let maxValue = 10
        for x in 0..<maxValue {
            for y in 0..<maxValue {
                let key = Point(x: y, y: x)
                var s: String = "."
                if let foundElement = pointsMap[key] {
                    s = String(foundElement)
                    print(s)
                }
            }
        }
    }
    
    private enum SearchQuery {
        case findMoreOrEqual
        case findLessOrEqual
    }
    
    enum Direction {
        case up
        case down
        case left
        case right
    }
    
    private static func search(report: [UInt16], query: SearchQuery) -> UInt16 {
        var searchResults: [UInt16]?
        var searchQueryIndex = 0
        var mask: UInt16 = 1
        var maxElement = report.max() ?? 0

        while maxElement > 1 {
            maxElement >>= 1
            mask <<= 1
        }
        
        repeat {
            let arrayToSearch = searchResults ?? report
            
            let onesCount = arrayToSearch.filter({ ($0 & mask) > 0 }).count
            let zerosCount = arrayToSearch.count - onesCount
            
            if query == .findMoreOrEqual {
                searchResults = arrayToSearch.filter {
                    if onesCount >= zerosCount {
                        let isCurrentBitEqualToOne = ($0 & mask) > 0
                        return isCurrentBitEqualToOne
                    } else {
                        let isCurrentBitEqualToZero = ($0 & mask) == 0
                        return isCurrentBitEqualToZero
                    }
                }
            } else {
                searchResults = arrayToSearch.filter {
                    if zerosCount <= onesCount {
                        let isCurrentBitEqualToZero = ($0 & mask) == 0
                        return isCurrentBitEqualToZero
                    } else {
                        let isCurrentBitEqualToOne = ($0 & mask) > 0
                        return isCurrentBitEqualToOne
                    }
                }
            }
            
            mask = mask >> 1
            searchQueryIndex += 1
                        
        } while searchResults?.count != 1
        
        return searchResults?.first ?? 0
    }
}
