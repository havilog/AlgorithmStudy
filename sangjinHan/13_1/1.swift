func solution(_ n:Int, _ delivery:[[Int]]) -> String {
    var canDeliver = Array(repeating: 0, count: n)
    var answer = ""

    let sortedDel = delivery.sorted{ $0[2] > $1[2] }

    // print(sortedDel)

    for del in sortedDel {
        if del[2] == 1 {
            canDeliver[del[0]-1] = 1
            canDeliver[del[1]-1] = 1
        } else {
            if canDeliver[del[0]-1] == 1 {
                canDeliver[del[1]-1] = -1
            } else if canDeliver[del[1]-1] == 1 {
                canDeliver[del[0]-1] = -1
            } else {
                continue
            }
        }
    }

    // print(canDeliver)

    for index in canDeliver {
        if index == 1 {
            answer += "O"
        } else if index == -1 {
            answer += "X"
        } else {
            answer += "?"
        }
    }

    return answer
}

// print(solution(7,[[5, 6, 0], [1, 3, 1], [1, 5, 0], [7, 6, 0], [3, 7, 1], [2, 5, 0]]))

//6,[[1, 3, 1], [3, 5, 0], [5, 4, 0], [2, 5, 0]]
//7,[[5, 6, 0], [1, 3, 1], [1, 5, 0], [7, 6, 0], [3, 7, 1], [2, 5, 0]]