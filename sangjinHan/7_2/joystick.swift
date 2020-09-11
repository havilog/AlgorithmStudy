/*
name	return
JEROEN	56
JAN		23
*/
//A = 65
let name = "ABAAAAAAABA"

func solution(_ name:String) -> Int {
	if name.count <= 0 { return 0 }
	
	let names = Array(name)
	var answer = 0
	var alpha = 0
	var move = -1
	var check = true
	var i = 0
	
	while true {
		if i == names.count { break }
		
		if Int(names[i].asciiValue!) == 65 && check {
			while true {
				check = false
				i += 1
				// print("check \(names[i])")
				if i == names.count { break }
				if Int(names[i].asciiValue!) != 65 { break }
				
			}
			if i == names.count { break }
		}
		
		if i == names.count { break }
		
		print("num : \(names[i]), i : \(i), move : \(move), alpha : \(alpha), check : \(check)")
		
		if  Int(names[i].asciiValue!) > 77 {
			alpha += 91 - Int(names[i].asciiValue!)
		}else {
			alpha += Int(names[i].asciiValue!) - 65
		}
	
		
			
		move += 1
		
		i += 1
	}
	answer = alpha + move
	
	i = names.count - 1
	move = 0
	alpha = 0
	check = true
	while true {
		if i < 0 { break }
		
		if Int(names[i].asciiValue!) == 65 && check {
			while true {
				check = false
				i -= 1
				// print("check \(names[i])")
				if i < 0 { break }
				if Int(names[i].asciiValue!) != 65 { break }
				
			}
			if i < 0 { break }
		}
		
		if i < 0 { break }
		
		print("num : \(names[i]), i : \(i), move : \(move), alpha : \(alpha), check : \(check)")
		
		if  Int(names[i].asciiValue!) > 77 {
			alpha += 91 - Int(names[i].asciiValue!)
		}else {
			alpha += Int(names[i].asciiValue!) - 65
		}
			
		move += 1
		
		i -= 1
	}
	
	// print("move : \(move), alpha : \(alpha)")
	answer = answer > move + alpha ? move + alpha : answer
    return answer
}

print(solution(name))