func solution(_ arr:[Int]) -> [Int] {
    var answer: [Int] = arr
    let minimum = answer.min()
    let idx = arr.firstIndex(of: minimum!)!
    answer.remove(at: idx)

    return answer.isEmpty ? [-1] : answer
}
