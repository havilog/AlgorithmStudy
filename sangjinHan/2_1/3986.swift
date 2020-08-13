var N = Int(readLine()!)!
var answer = 0

/* 
3
ABAB
AABB
ABBA
*/

for _ in 0..<N{
	let inputStr = readLine()!
	let str = Array(inputStr)
	var stack = [Character]()
	
	for i in 0..<str.count{
		stack.append(str[i])
		if stack.count>=2{
			if (stack[stack.count-1] == stack[stack.count-2]) {
				stack.removeLast()
				stack.removeLast()
			}	
		}
	}
	
	if stack.count == 0{
		answer+=1
	}
}


print(answer)