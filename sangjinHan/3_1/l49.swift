//49. Group Anagrams
//[["bat"], ["eat", "tea", "ate"], ["tan", "nat"]]

var strs: [String] = ["eat", "tea", "tan", "ate", "nat", "bat"]

var dict = [String : [String]]()

for str in strs{
	dict[String(str.sorted()), default : []].append(str)
}

return Array(dict.values)

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

/*빠르고 메모리 적은 코드
var result = [[String]]()
var dict = [String:[String]]()
for i in 0..<strs.count {
    let word = String(strs[i].sorted())
    if let _ = dict[word] {
        dict[word]!.append(strs[i])
    }
    else {
        dict[word] = [strs[i]]
    }
}
for value in dict.values {
    result.append(value)
}
return result
*/

/* 한줄짜리 정답코드 */
//return Array(Dictionary(grouping: strs) { $0.sorted() }.values)


/* Using HashMap 
var map = [String: [String]]()
for str in strs {
    let key = String(str.sorted())
    map[key, default: []].append(str)
}
return Array(map.values)
*/