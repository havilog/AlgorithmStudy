func solution(_ n:Int, _ times:[Int]) -> Int64 {
  let sortedTime = times.sorted()
  var min:Int64 = 1
  var max:Int64 = Int64(times.last!*n)
  var answer = max

  while min <= max {
    let mid:Int64 = (min+max)/2
    var sum:Int64 = 0
    
    for i in sortedTime.indices {
      sum += mid/Int64(times[i])
    }

    if n > sum {
      min = mid + 1
    } else {
       if mid <= answer{
         answer = mid
       }
      max = mid - 1
    }
  }

  return 0
}

let n = 10
let times = [3,5,8,11]

print(solution(n,times))//return 10import Foundation