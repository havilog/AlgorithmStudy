/* 신입사원
*/
for _ in 0..<Int(readLine()!)!{
	var pass = 1
	var candidates = [[Int]]()
	
	for _ in 0..<Int(readLine()!)! {
		let score = readLine()!.split(separator:" ").map{ Int($0)! }
		candidates.append(score)
	}
	
	candidates.sort{ (c1, c2) -> Bool in
		return c1[0] < c2[0]
	}
	print(candidates)
	
	var minimum = candidates[0][1]
	
	for i in 1..<candidates.count{
		if minimum>candidates[i][1]{
			minimum = candidates[i][1]
			pass+=1
		}
	}
	
	print(pass)
}

