
/*

no	new_id	result
예1	"...!@BaT#*..y.abcdefghijklm"	"bat.y.abcdefghi"
예2	"z-+.^."	"z--"
예3	"=.="	"aaa"
예4	"123_.def"	"123_.def"
예5	"abcdefghijklmn.p"	"abcdefghijklmn"

*/
let new_id = ".-_____----__.+.+>>>+>+>asdASDAD...AS+++ASDFSFD"

func solution(_ new_id:String) -> String {
	let check = checkId(new_id)
	
	// print("check : \(check)")
	
	//아이디 검사 통과
	if check {
		return new_id
	}
	
	return editId(new_id)
}

func checkId(_ new_id:String) -> Bool {
	var tempIndex = [Int]()
	var tempComma = -100
	
	//길이
	if new_id.count < 3 || new_id.count > 15 {
		return false
	}
	
	//알파벳, 숫자, 특수문자
	for (index,val) in new_id.enumerated() {
		// print("\(index), \(val)")
		let tempVal = Int(val.asciiValue!)
		// print(tempVal)
		
		if tempVal == 95 {
			//_
		}else if tempVal == 45 {
			//-
		}else if tempVal == 46 {
			//.
			tempIndex.append(index)
		}else if tempVal >= 48 && tempVal <= 57 {
			//0~9
		}else if tempVal >= 97 && tempVal <= 122 {
			//a~z
		}else {
			return false
		}
	}
	
	//..
	for i in tempIndex {
		if i == 0 || i == new_id.count - 1 {
			return false
		} 
		
		if tempComma == i - 1 {
			return false
		}
		
		tempComma = i
	}
	
	// print(tempIndex)
	
	return true
}

func editId(_ new_id:String) -> String {
	var answer = ""
	// var tempIndex = [Int]()
	var tempComma = -100
	
	
	for (index,val) in new_id.enumerated() {
		var ascii = Int(val.asciiValue!)
		// print("ascii : \(ascii)")
		
		if answer.count >= 15 {
			continue
		}
		
		//A -> a
		if ascii >= 65 && ascii <= 90 {
			ascii += 32
			answer.append(Character(UnicodeScalar(ascii)!))
		}else if ascii != 95 && ascii != 45 && ascii != 46 && ( ascii < 48 || (ascii > 57 && ascii < 97) || ascii > 122 ) {
			// print("숫자 알파 -_ 아님")
			continue
		}else if ascii == 46 {
			// print(".일때")
			
			if index == 0 {
				// print(". 이  0번째")	
			}else if tempComma != index - 1 {
				answer.append(Character(UnicodeScalar(ascii)!))
			}else{
				// print(".연속")
			}
			tempComma = index
		}else {
			answer.append(Character(UnicodeScalar(ascii)!))
		}
	}
	
	if answer.count == 0 {
		answer.append("a")
	}
	
	while true {
		if answer.count == 0 { break }
		if answer.last! != "." { break }
		if answer.last! == "." {
			answer.removeLast()
		}
	}
	
	while true {
		if answer.count == 0 { break }
		if answer.first! != "." { break }
		if answer.first! == "." {
			answer.removeFirst()
		}
	}
	
	if answer.count == 0 {
		answer.append("a")
	}
	
	if answer.count == 1 {
		answer.append(answer.last!)
	}
	
	if answer.count == 2 {
		answer.append(answer.last!)
	}
	
	tempComma = -100
	
	var tempArr = Array(answer)
	
	for (index,val) in tempArr.enumerated() {
		if val == "." {
			if tempComma == index - 1 {
				tempArr.remove(at : index)
			}
			tempComma = index
		}
	}
	
	return String(tempArr)
}

print(solution(new_id))