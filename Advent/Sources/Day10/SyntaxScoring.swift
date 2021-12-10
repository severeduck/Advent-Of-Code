
import Foundation

public struct SyntaxScoring {
    public static func calculateSyntaxErrorScore(
        for input: [String]
    ) -> Int {
        let openingBraces = ["(", "[", "{", "<"]
        let closingBraces = [")", "]", "}", ">"]
        let bracesPairs = [("(", ")"), ("[", "]"), ("{", "}"), ("<", ">")]
        let errorValuesTable = [")": 3, "]": 57, "}": 1197, ">": 25137]
        let scoreCalculationRules = [")": 1, "]": 2, "}": 3, ">": 4]
        var errorsFound = [String]()
        var completingLines = [String]()
        var completingLineScores = [Int]()

        input.forEach {
            var stack = [String]()
            var errorSymbol: String?
            var index = 0
            
            repeat {
                let stringIndex = $0.index($0.startIndex, offsetBy: index)
                let symbol = String($0[stringIndex])
//                print("symbol[\(index)] == \(symbol)")
                index += 1
                
                let testOpposite = findOppositeBrace(for: symbol, in: openingBraces, bracesPairs: bracesPairs)
                print("sybmol: \(symbol); testOpposite: \(testOpposite)")
                
                if openingBraces.contains(symbol) {
                    stack.append(symbol)
//                    print("\(stack) <= \(symbol) == \(stack)")
                    continue
                }
                
                guard let lastFromStack = stack.popLast() else {
                    stack.append(symbol)
//                    print("\(stack) <= \(symbol) == \(stack)")
                    continue
                }
                
                guard let indexToCheck = closingBraces.firstIndex(of: symbol) else {
                    errorSymbol = symbol
//                    print("errorSymbol = \(symbol)")
                    break
                }
                
                let pairToCheckAgainst = bracesPairs[indexToCheck]
                
//                print("lastFromStack: \(lastFromStack) == pairToCheckAgainst.0: \(pairToCheckAgainst.0)")
                guard lastFromStack == findOppositeBrace(for: symbol, in: closingBraces, bracesPairs: bracesPairs) else {
                    errorSymbol = symbol
//                    print("errorSymbol = \(symbol)")
                    break
                }
                
//                _ = stack.popLast()
//                print("\(stack) >= last == \(stack)")
                
            } while index < $0.count && errorSymbol == nil
            
            if let errorSymbol = errorSymbol {
                errorsFound.append(errorSymbol)
            } else {
                let incompleteLine = stack.reduce("", +)
                let completingLine = incompleteLine
                    .reversed()
                    .compactMap { findOppositeBrace(for: String($0), in: openingBraces, bracesPairs: bracesPairs) }
                    .joined()
                completingLines.append(completingLine)
                
                var score = 0
                completingLine.forEach {
                    let symbol = String($0)
                    score *= 5
                    score += scoreCalculationRules[symbol]!
                }
                
                completingLineScores.append(score)
            }
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

// [({([[{{ }}]])})]
// [({([[{{
