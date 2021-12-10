
import Foundation

public struct SyntaxScoring {
    public static func calculateSyntaxErrorScore(
        for input: [String]
    ) -> Int {
        let openingBraces = ["(", "[", "{", "<"]
        let closingBraces = [")", "]", "}", ">"]
        let bracesPairs = [("(", ")"), ("[", "]"), ("{", "}"), ("<", ">")]
        let errorValuesTable = [")": 3, "]": 57, "}": 1197, ">": 25137]
        var errorsFound = [String]()
        
        input.forEach {
            var stack = [String]()
            var errorSymbol: String?
            var index = 0
            
            repeat {
                let stringIndex = $0.index($0.startIndex, offsetBy: index)
                let symbol = String($0[stringIndex])
                print("symbol[\(index)] == \(symbol)")
                index += 1
                
                if openingBraces.contains(symbol) {
                    stack.append(symbol)
                    print("\(stack) <= \(symbol) == \(stack)")
                    continue
                }
                
                guard let lastFromStack = stack.popLast() else {
                    stack.append(symbol)
                    print("\(stack) <= \(symbol) == \(stack)")
                    continue
                }
                
                guard let indexToCheck = closingBraces.firstIndex(of: symbol) else {
                    errorSymbol = symbol
                    print("errorSymbol = \(symbol)")
                    break
                }
                
                let pairToCheckAgainst = bracesPairs[indexToCheck]
                
                print("lastFromStack: \(lastFromStack) == pairToCheckAgainst.0: \(pairToCheckAgainst.0)")
                guard lastFromStack == pairToCheckAgainst.0 else {
                    errorSymbol = symbol
                    print("errorSymbol = \(symbol)")
                    break
                }
                
                print("\(stack) >= last == \(stack)")
                
            } while index < $0.count && errorSymbol == nil
            
            if let errorSymbol = errorSymbol {
                errorsFound.append(errorSymbol)
            }
        }
        
        return errorsFound.reduce(0) { partialResult, errorSymbol in
            partialResult + errorValuesTable[errorSymbol]!
        }
    }
}
