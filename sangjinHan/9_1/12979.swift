import Foundation

/*
 N    stations    W    answer
 11    [4, 11]    1    3
 16    [9]    2    3
 
 */

let n = 11
let stations = [4,11]
let W = 1


func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int {
    var answer = 0
    var stationIdx = 0
    var location = 1
	
    while (location <= n) {
        if (stationIdx < stations.count) && (location >= stations[stationIdx] - w) {
            location = stations[stationIdx] + w + 1
            stationIdx += 1
        } else {
            location += 2*w+1
            answer += 1
        }
    }
	
    return answer
}

print(solution(n, stations, W))
