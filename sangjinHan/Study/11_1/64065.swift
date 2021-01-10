import Foundation

func solution(_ s:String) -> [Int] {

    let answer = s.components(separatedBy: ["{","}"]).filter { $0 != "" && $0 != ","}.sorted(by: {
        $0.count < $1.count
    }).reduce([String]()) {
        var result = $0
        result.append(contentsOf: Set($1.components(separatedBy: ",")).subtracting(Set($0)))
        return result
    }
    return answer.map { Int(String($0))! }
}