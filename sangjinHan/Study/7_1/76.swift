//76. Minimum Window Substring
/*
Input: S = "ADOBECODEBANC", T = "ABC"
Output: "BANC"

let input = "bdab"
let t = "ab"


*/
let input = "bdab"
let t = "ab"

func minWindow(_ s: String, _ t: String) -> String {
    let sArr = Array(s)
	let tArr = Array(t)
	var answer:String = ""
	var find = 0
	var check = false
	var temp:String = ""
	var dict = [String:Int]()
	var start = 0
	var end = 0
	
	for char in tArr {
		dict[String(char),default:0] += 1
	}
	
	for i in 0..<s.count {
		if dict[String(sArr[i]),default:0] > 0 {
			check = true
			find += 1
			dict[String(sArr[i])]! -= 1
		}
		
		if check { 
			temp += String(sArr[i])
		}
		
		print("find : \(find), temp : \(temp), i: \(i), answer = \(answer)")
		
		if find == t.count {
			find = find % t.count
			if answer.count == 0 {
				answer = temp
			}else{
				answer = answer.count < temp.count ? answer : temp 	
			}
			check = false
			temp = ""
			for char in tArr {
				dict[String(char),default:0] += 1
			}
		}
		
	}
	
	return answer
}

print(minWindow(input,t))


/*
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
 
        let tt = Array(t.utf16).map { Int($0) }
        let ss = Array(s.utf16).map { Int($0) }
        // create hashmap 
        var hash = [Int](repeating: 0, count: 128)
        for n in tt {
            hash[n] += 1
        }
        
        var count = tt.count, start = 0, l = 0, r = 0, length = Int.max
        
        while r < ss.count {
            if hash[ss[r]] > 0 {
                count -= 1
            }
            hash[ss[r]] -= 1
            r += 1
            while count == 0 {
                if r - l < length {
                    length = r - l
                    start = l
                }
                if hash[ss[l]] == 0 {
                    count += 1
                }
                hash[ss[l]] += 1
                l += 1
            }
        }
        
        if length > ss.count {
            return ""
        }
        
        let index1 = s.index(s.startIndex, offsetBy: start)
        let index2 = s.index(s.startIndex, offsetBy: start + length)
        return s.substring(with: index1..<index2)
    }
}
*/