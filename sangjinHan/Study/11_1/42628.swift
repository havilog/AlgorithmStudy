import Foundation

func solution(_ s:String) -> Int {
  if s.count == 0 { 
        return 0 
    } else if s.count == 1 {
        return 1
    } else if s.count == 2 {
        return s.first! == s.last! ? 2 : 0
    }
  var longest = 0
  var str = Array(s)

  for i in 0..<s.count-1 {
    for j in (i+2..<s.count).reversed() {
      if longest > j-i { break }
      if i >= j { break }
      var lhs = i
      var rhs = j
      var cnt = 0
      print(i,j)
      while true {
        if lhs+1 == rhs  {
          cnt += 2
          longest = longest > cnt ? longest : cnt
          print("a")
          break
        } else if lhs == rhs {
          cnt += 1
          longest = longest > cnt ? longest : cnt
          print("b")
          break 
        }

        if str[lhs] == str[rhs] {
          cnt += 2
          lhs += 1
          rhs -= 1
        } else {
          lhs = i
          rhs -= 1
          cnt = 0
        }
      }
      print(cnt)
      if cnt <= longest {
        break 
      }
    }
  }
  
  return longest
}

print(solution("abcbanlknabcdedcbalojnsdoifhoe"))