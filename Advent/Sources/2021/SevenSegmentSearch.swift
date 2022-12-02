
import Foundation

/*
 
 0:      1:      2:      3:      4:
aaaa    ....    aaaa    aaaa    ....
b    c  .    c  .    c  .    c  b    c
b    c  .    c  .    c  .    c  b    c
....    ....    dddd    dddd    dddd
e    f  .    f  e    .  .    f  .    f
e    f  .    f  e    .  .    f  .    f
gggg    ....    gggg    gggg    ....

 5:      6:      7:      8:      9:
aaaa    aaaa    aaaa    aaaa    aaaa
b    .  b    .  .    c  b    c  b    c
b    .  b    .  .    c  b    c  b    c
dddd    dddd    ....    dddd    dddd
.    f  e    f  .    f  e    f  .    f
.    f  e    f  .    f  e    f  .    f
gggg    gggg    ....    gggg    gggg
 
 */

public enum DisplaySegment: String, RawRepresentable, CaseIterable, Hashable {
    case none, a, b, c, d, e, f, g
    
    mutating func next() {
        let allCases = Self.allCases
        self = allCases[(allCases.firstIndex(of: self)! + 1) % allCases.count]
    }
}

public struct DigitDisplay: Hashable {
    public static let digit0 = DigitDisplay(segments: [.a,    .b,    .c,    .none, .e,    .f,    .g])
    public static let digit1 = DigitDisplay(segments: [.none, .none, .c,    .none, .none, .f,    .none])
    public static let digit2 = DigitDisplay(segments: [.a,    .none, .c,    .d,    .e,    .none, .g])
    public static let digit3 = DigitDisplay(segments: [.a,    .none, .c,    .d,    .none, .f,    .g])
    public static let digit4 = DigitDisplay(segments: [.none, .b,    .c,    .d,    .none, .f,    .none])
    public static let digit5 = DigitDisplay(segments: [.a,    .b,    .none, .d,    .none, .f,    .g])
    public static let digit6 = DigitDisplay(segments: [.a,    .b,    .none, .d,    .e,    .f,    .g])
    public static let digit7 = DigitDisplay(segments: [.a,    .none, .c,    .none, .none, .f,    .none])
    public static let digit8 = DigitDisplay(segments: [.a,    .b,    .c,    .d,    .e,    .f,    .g])
    public static let digit9 = DigitDisplay(segments: [.a,    .b,    .c,    .d,    .none, .f,    .g])
    public static let invalidDigit = DigitDisplay(segments: [.none])

    public let segments: [DisplaySegment]
    
    public var isDigit: Bool {
        var isDigit = false
        for digit in [Self.digit1, Self.digit2, Self.digit3,
         Self.digit4, Self.digit5, Self.digit6,
         Self.digit7, Self.digit8, Self.digit9,
         Self.digit0] {
            isDigit = isEqualTo(digitDisplay: digit)
            if isDigit {
                return true
            }
        }
        return isDigit
    }
    
    func isEqualTo(digitDisplay: DigitDisplay) -> Bool {
        digitDisplay.segments.filter({ $0 != .none }).count == segments.filter({ $0 != .none }).count
            && Set(digitDisplay.segments.filter({ $0 != .none })).isSubset(of: Set(segments.filter({ $0 != .none })))
    }
    
    var integerValue: Int {
        if isEqualTo(digitDisplay: DigitDisplay.digit0) { return 0 }
        if isEqualTo(digitDisplay: DigitDisplay.digit1) { return 1 }
        if isEqualTo(digitDisplay: DigitDisplay.digit2) { return 2 }
        if isEqualTo(digitDisplay: DigitDisplay.digit3) { return 3 }
        if isEqualTo(digitDisplay: DigitDisplay.digit4) { return 4 }
        if isEqualTo(digitDisplay: DigitDisplay.digit5) { return 5 }
        if isEqualTo(digitDisplay: DigitDisplay.digit6) { return 6 }
        if isEqualTo(digitDisplay: DigitDisplay.digit7) { return 7 }
        if isEqualTo(digitDisplay: DigitDisplay.digit8) { return 8 }
        if isEqualTo(digitDisplay: DigitDisplay.digit9) { return 9 }
        return -1
    }

    public init(segments: [DisplaySegment]) {
        self.segments = segments
    }
    
    public init(string: String) {
        self.segments = string.compactMap { DisplaySegment(rawValue: String($0)) }
    }
    
    private init(integerValue: Int) {
        switch integerValue {
        case 0: self = .digit0
        case 1: self = .digit1
        case 2: self = .digit2
        case 3: self = .digit3
        case 4: self = .digit4
        case 5: self = .digit5
        case 6: self = .digit6
        case 7: self = .digit7
        case 8: self = .digit8
        case 9: self = .digit9
        default: self = .invalidDigit
        }
    }
}

typealias WireRelation = (DisplaySegment, DisplaySegment)

public struct WireRelationsSolver {
    private var pairs: [WireRelation]
    
    init() {
        /*
         .a = .a
         .b = .a
         ...
         .g = .a
         */
        pairs = DisplaySegment.allCases.dropFirst().map { ($0, .a) }
    }
    
    func decode(digitDisplay: DigitDisplay) -> DigitDisplay {
        let decoded = DigitDisplay(segments: digitDisplay.segments.map({ digitDisplaySegment in
            if let foundRelation = pairs.first(where: { $0.0 == digitDisplaySegment }) {
                return foundRelation.1
            }
            return .none
        }))
        return decoded
    }
    
    mutating func next() {
        var cursor = pairs.count - 1
        while pairs[cursor].1 == DisplaySegment.g {
            pairs[cursor].1 = DisplaySegment.a
            cursor -= 1
        }
        pairs[cursor].1.next()
    }
}


struct SevenSegmentSearch {
    public static func decodedOutputSum(input: [DigitDisplay], output: [DigitDisplay]) -> Int {
        var solver = WireRelationsSolver()
        
    outerLoop: repeat {
        for inputDigitDisplay in input {
            if !solver.decode(digitDisplay: inputDigitDisplay).isDigit {
                solver.next()
                continue outerLoop
            }
        }
        
        let outputDigitDisplays = output.map { solver.decode(digitDisplay: $0) }
        let outputDigits = outputDigitDisplays.map { $0.integerValue }
        return outputDigits.reduce(0, { $0 * 10 + $1 })
    } while 1 > 0
        
    }
}
