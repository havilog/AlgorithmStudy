//단어 변환
/*
begin	target	words	return
hit	cog	[hot, dot, dog, lot, log, cog]	4
hit	cog	[hot, dot, dog, lot, log]	0
*/
import Foundation

let begin = "hit"
let target = "cog"
let words = ["hot", "dot", "dog", "lot", "log", "cog"]
// hit -> hot -> dot -> dog -> cog

import Foundation

extension String {
    func distance(with str: String) -> Int {
        return zip(self,str).filter({ $0.0 != $0.1 }).count
    }
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {

    guard words.contains(target) else {
        return 0
    }
    let words = [begin] + words
    var graph: [[Int]] = Array(repeating: [], count: words.count)

    for i in 0..<words.count {
        for j in i+1..<words.count {
            if i != j,words[i].distance(with: words[j]) == 1 {
                graph[i].append(j)
                graph[j].append(i)
            }
        }
    }

    var distance = 0
    var visited = Array(repeating: false,count: words.count)

    var queue = [0]

    while !queue.isEmpty {
        let c = queue.count

        for _ in 0..<c {
            let here = queue.removeFirst()

            if visited[here] {
                continue
            }

            visited[here] = true

            for j in graph[here] {
                if j != 0,target == words[j] {
                    return distance+1
                }
                queue.append(j)
            }
        }

        distance+=1
    }

    return 0
}



// import Foundation

// func checkTransfer(_ from: String, to: String) -> Bool {
//     let target = Array(from)
//     let departure = Array(to)

//     var count = 0

//     for i in target.indices {
//         if target[i] != departure[i] { count += 1 }
//         if count > 1 { break }
//     }

//     return count < 2
// }

// func recursion(_ begin: String, _ target: String, _ words: [String]) -> [[String]] {
//     guard !words.isEmpty, begin != target, words.contains(target) else { return [[begin]] }

//     var result = [[String]]()

//     words.indices.forEach {
//         guard checkTransfer(begin, to: words[$0]) else { return }

//         var _words = words
//         _words.remove(at: $0)

//         result += recursion(words[$0], target, _words)
//             .map { [begin] + $0 }
//     }

//     return result
// }

// func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
//     return (recursion(begin, target, words)
//         .filter { $0.last == target }
//         .min(by: { $0.count < $1.count })?
//         .count ?? 1)
//         - 1
// }
