//387. First Unique Character in a String

/*
s = "leetcode"
return 0.

s = "loveleetcode"
return 2.
*/
let s:String = "loveleetcode"

func firstUniqChar(_ s: String) -> Int {
	// let sArr = Array(s)
	
	var dict = [Character:Int]()
	/*
	s.forEach{ dict[String($0),default : 0] += 1 }

	for i in 0..<sArr.count{
		if dict[String(sArr[i])] == 1{
			return i
		}
	}
	*/
	
	for char in s{
		dict[char,default : 0] += 1
	}
	
	for (index,char) in s.enumerated(){
		if dict[char] == 1{
			return index
		}
	}
	
	return -1
}


print(firstUniqChar(s))



/* 더 빠른 코드
var countFor = [Int](repeating:0, count:26)
  let offset = 97 // offset for UTF8 lowercase letters
  
  for charCode in s.utf8 {
    let adjustedCharCode = Int(charCode) - offset
    countFor[adjustedCharCode] += 1
  }
  
  for (i, charCode) in s.utf8.enumerated() {
    let adjustedCharCode = Int(charCode) - offset
    if countFor[adjustedCharCode] == 1 {
      return i
    }
  }
  
  return -1
*/