import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
  var dict = [String:Int]()
  var dict2 = [Int:(String,Int)]()
  var answer = [Int]()

  for index in genres.indices {
    dict[genres[index] , default : 0] += plays[index]
    dict2[index] = (genres[index],plays[index])
  }

  let best = dict.sorted{ $0.1 > $1.1 }.map{ $0.key }
  
  let sortedDict = dict2.sorted{ 
    if $0.value.0 == $1.value.0 {
      return $0.value.1 > $1.value.1
    } else {
      return $0.value.0 < $1.value.0
    }
  }

  for index in best {
    var cnt = 0
    for dic in sortedDict {
      if cnt >= 2 { break }
      if dic.value.0 == index {
        answer.append(dic.key)
        cnt += 1
      }
    } 
  }

  return answer
}

let genres = ["classic", "pop", "classic", "classic", "pop","bts","bts","bts"]	
let plays = [500, 600, 150, 800, 2500, 10, 20, 30]

print(solution(genres,plays))