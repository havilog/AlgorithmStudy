//438. Find All Anagrams in a String
/*
Input:
s: "cbaebabacd" p: "abc"

Output:
[0, 6]

Explanation:
The substring with start index = 0 is "cba", which is an anagram of "abc".
The substring with start index = 6 is "bac", which is an anagram of "abc".

Input:
s: "abab" p: "ab"

Output:
[0, 1, 2]

Explanation:
The substring with start index = 0 is "ab", which is an anagram of "ab".
The substring with start index = 1 is "ba", which is an anagram of "ab".
The substring with start index = 2 is "ab", which is an anagram of "ab".
*/

let s:String = "cbaebabacd"
let p:String = "abc"

func findAnagrams(_ s: String, _ p: String) -> [Int] {
	var answer = [Int]()
	
	var map = [Int](repeating:0, count:26)
	
	var left: Int = 0
	var right: Int = 0
	var count: Int = 0
	
	let sLen = s.utf8.count
	let pLen = p.utf8.count
	
	guard sLen >= pLen else { return [] }
	
	p.utf8.forEach({ map[Int($0) - 97] += 1 })
	
	let sVals = Array(s.utf8)
	
	// print(sVals)
	
	while right < sLen{
		let rightIndex = Int(sVals[right]) - 97
		if map[rightIndex] > 0{
			map[rightIndex] -= 1
			count += 1
			right += 1
			// print("right : \(right)")
		}else{
			let leftIndex = Int(sVals[left]) - 97
			map[leftIndex] += 1
			count -= 1
			left += 1
			// print("left : \(left)")
		}
		
		if count == pLen{
			answer.append(left)
		}
	}
	
	return answer
}

print(findAnagrams(s,p))