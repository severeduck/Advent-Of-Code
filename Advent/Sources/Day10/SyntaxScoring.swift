
import Foundation

public struct SyntaxScoring {
    public static func calculateSyntaxErrorScore(
        for input: [String]
    ) -> Int {
        let openingBraces = ["(", "[", "{", "<"]
        let closingBraces = [")", "]", "}", ">"]
        let bracesPairs = [("(", ")"), ("[", "]"), ("{", "}"), ("<", ">")]
        let scoreCalculationRules = [")": 1, "]": 2, "}": 3, ">": 4]
        var completingLineScores = [Int]()

        input.forEach {
            var stack = [String]()
            var isLineIncorrect = false
            var index = 0
            
            repeat {
                let stringIndex = $0.index($0.startIndex, offsetBy: index)
                let symbol = String($0[stringIndex])
                index += 1
                                
                if openingBraces.contains(symbol) {
                    stack.append(symbol)
                    continue
                }
                
                guard let lastFromStack = stack.popLast() else {
                    stack.append(symbol)
                    continue
                }
                
                guard lastFromStack == findOppositeBrace(for: symbol, in: closingBraces, bracesPairs: bracesPairs) else {
                    isLineIncorrect = true
                    break
                }
            } while index < $0.count && !isLineIncorrect
            
            if isLineIncorrect { return }

            let incompleteLine = stack.reduce("", +)
            let completingLine = incompleteLine
                .reversed()
                .compactMap { findOppositeBrace(for: String($0), in: openingBraces, bracesPairs: bracesPairs) }
                .joined()
            
            var score = 0
            completingLine.forEach {
                score *= 5
                score += scoreCalculationRules[String($0)]!
            }
            completingLineScores.append(score)
        }
        
        return completingLineScores.sorted(by: <)[(completingLineScores.count / 2)]
    }
    
    private static func findOppositeBrace(
        for symbol: String,
        in symbols: [String],
        bracesPairs: [(String, String)]
    ) -> String? {
        
        guard let indexToCheck = symbols.firstIndex(of: symbol) else {
            return nil
        }
        
        let pairToCheckAgainst = bracesPairs[indexToCheck]

        return pairToCheckAgainst.0 == symbol
            ? pairToCheckAgainst.1
            : pairToCheckAgainst.0
    }
}
