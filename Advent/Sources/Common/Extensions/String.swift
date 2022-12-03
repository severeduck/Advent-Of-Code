
import Foundation

extension String {
    public var ints: [Int] {
        split(separator: "\n").compactMap { Int($0) }
    }
    
    public var digitsAsInts: [[Int]] {
        strings.compactMap {
            $0.compactMap {
                Int(String($0))
            }
        }
    }
    
    public var commaSeparatedInts: [Int] {
        replacingOccurrences(of: "\n", with: "")
        .split(separator: ",")
        .compactMap { Int($0) }
    }
    
    public var uint16s: [UInt16] {
        split(separator: "\n").compactMap { UInt16($0, radix:2) }
    }
    
    public var strings: [String] {
        split(separator: "\n").compactMap { String($0) }
    }
    
    public var stringsIncludingEmptySubsequences: [String] {
        split(separator: "\n", omittingEmptySubsequences: false).map { String($0) }
    }
    
    public var steps: [Step] {
        strings.compactMap { (step: String) -> Step? in
            let stepComponents = step
                .split(separator: " ")
                .compactMap { String($0) }
            guard
                let directionString = stepComponents.first,
                let distanceString = stepComponents.last,
                let direction = Direction(rawValue: directionString),
                let distance = Int(distanceString)
            else {
                return nil
            }
            return Step(direction: direction, distance: distance)
        }
    }
    
    public var lines: [Line] {
        strings.compactMap {
            let coordinates: [String] = $0
                .components(separatedBy: " -> ")
                .map { String($0) }
            
            let startCoordinateComponents = coordinates[0]
                .split(separator: ",")
                .compactMap { Int($0) }
            let endCoordinateComponents = coordinates[1]
                .split(separator: ",")
                .compactMap { Int($0) }
            
            return Line(
                start: Point(
                    x: startCoordinateComponents[0],
                    y: startCoordinateComponents[1]
                ),
                end: Point(
                    x: endCoordinateComponents[0],
                    y: endCoordinateComponents[1]
                )
            )
        }
    }
    
    public var digitalDisplayData: [([DigitDisplay], [DigitDisplay])] {
        strings.compactMap {
            let components = $0.components(separatedBy: " | ")
            
            let inputDigitDisplay = components[0]
                .split(separator: " ")
                .compactMap({ DigitDisplay(string: String($0)) })
            
            let outputDigitDisplay = components[1]
                .split(separator: " ")
                .compactMap({ DigitDisplay(string: String($0)) })

            return (inputDigitDisplay, outputDigitDisplay)
        }
    }
}

extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
}
