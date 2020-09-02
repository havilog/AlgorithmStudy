//32. Longest Valid Parentheses

/*

Example 1:

Input: "(()"
Output: 2
Explanation: The longest valid parentheses substring is "()"
Example 2:

Input: ")()())"
Output: 4
Explanation: The longest valid parentheses substring is "()()"

*/

let s:String = ")()()))))((((()))))()()()()()))))(())"

func longestValidParentheses(_ s: String) -> Int {
    var answer: Int = 0
	var check: Bool = false
	var temp: Character = "."
	var cnt: Int = 0
	
	for char in s {
		// print("check : \(check) , cnt : \(cnt) , char : \(char)")
		if char == "(" && !check {
			check = true
			cnt += 1
			temp = "("
			continue
		}
		
		if check {
			if char != temp {
				cnt += 1
				temp = char
			}else {
				check = false
				if cnt > answer {
					answer = cnt	
				}
				cnt = 0
				if char == "(" && !check {
					check = true
					cnt += 1
					temp = "("
					continue
				}
			}
		}
	}
	
	if cnt > answer {
		answer = cnt	
	}
	
	if answer == 1 {
		answer = 0
	}
	
	return answer
}

print(longestValidParentheses(s))