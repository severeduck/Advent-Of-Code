
import Foundation

extension String {
    public var ints: [Int] {
        split(separator: "\n").compactMap { Int($0) }
    }
    
    public var strings: [String] {
        split(separator: "\n").compactMap { String($0) }
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
}
