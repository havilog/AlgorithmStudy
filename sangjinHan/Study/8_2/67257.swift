/*
expression	result
"100-200*300-500+20"	60420
"50*6-3*2"	300
*/
import Foundation

let expression = "100-200*300-500+20"

import Foundation

func solution(_ expression: String) -> Int64 {
    let priorities: [String] = ["*+-", "*-+", "+*-", "+-*", "-*+", "-+*"]
    let values = expression.replacingOccurrences(of: "-", with: ",-,").replacingOccurrences(of: "+", with: ",+,").replacingOccurrences(of: "*", with: ",*,").components(separatedBy: ",")

    var results: [Int64] = []
    priorities.forEach({
        var values = values
        var priority = $0
        while let last = priority.popLast() {
            while let index = values.firstIndex(of: String(last)) {
                let lhs = Int64(values[index - 1])!
                let rhs = Int64(values[index + 1])!
                let newValue: Int64 = {
                    switch last {
                    case "*": return lhs * rhs
                    case "+": return lhs + rhs
                    case "-": return lhs - rhs
                    default: return 0
                    }
                }()
                values.removeSubrange((index - 1)...(index + 1))
                values.insert("\(newValue)", at: index - 1)
            }
        }

        results.append(abs(Int64(values[0])!))
    })

    return results.max() ?? 0
}

print(solution(expression))