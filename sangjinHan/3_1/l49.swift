var inputStr: [String] = ["eat", "tea", "tan", "ate", "nat", "bat"]

var dict = [String : Int]()


/* 시간초과
var answerStr = [[String]]()
var tempStr = [String]()

var check: [Bool] = Array(repeating: false, count: inputStr.count)

for i in 0..<inputStr.count{
	if !check[i]{
		tempStr.append(inputStr[i])
		check[i] = true
		
		for j in 1..<inputStr.count{
			if check[j]{
				continue
			}else{
				if tempStr[0].sorted() == inputStr[j].sorted(){
					tempStr.append(inputStr[j])
					check[j] = true
				}
			}
		}
		
		answerStr.append(tempStr)
		tempStr.removeAll()
	}
}
*/

/* 한줄짜리 정답코드 
return Array(Dictionary(grouping: strs) { $0.sorted() }.values)
*/

/* Using HashMap 
var map = [String: [String]]()
for str in strs {
    let key = String(str.sorted())
    map[key, default: []].append(str)
}
return Array(map.values)
*/