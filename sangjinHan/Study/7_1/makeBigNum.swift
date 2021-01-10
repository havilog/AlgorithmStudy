let S = "1231234"
let k = 3

func solution(_ number:String, _ k:Int) -> String {
    let map = number.map{String($0)}
    var stack = [String]()
    var count = 0
    for i in 0..<number.count{
        while count < k && !stack.isEmpty && stack.last! < map[i] {
            stack.removeLast()
            count += 1
        }
            if count >= k {
                stack.append(contentsOf: map[i...])
                break
            }else{
                stack.append(map[i])
        }
    }
    return String(stack.joined().prefix(number.count-k))
}

print(solution(S,k))