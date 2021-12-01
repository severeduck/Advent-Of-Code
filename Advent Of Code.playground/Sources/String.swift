
import Foundation

extension String {
    public var ints: [Int] {
        split(separator: "\n").compactMap { Int($0) }
    }
}
