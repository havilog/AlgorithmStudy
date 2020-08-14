// Letter Combinations of a Phone Number
// dict 더 쉽게 선언할 수 있는 방법이 있는지?
/*
let phoneDict: [Int : String] = [
        2 : "abc", 
        3 : "def",
        4 : "ghi",
        5 : "jkl",
        6 : "mno",
        7 : "pqrs",
        8 : "tuv",
        9 : "wxyz"
]
*/


// should return 
//["adg", "adh", "adi", "aeg", "aeh", "aei", "afg", "afh", "afi", "bdg", "bdh", "bdi", "beg", "beh", "bei", "bfg", "bfh", "bfi", "cdg", "cdh", "cdi", "ceg", "ceh", "cei", "cfg", "cfh", "cfi"]

let digits = "234" 
var keyboard = [String:[String]]()

keyboard["2"] = ["a","b","c"]
keyboard["3"] = ["d","e","f"]
keyboard["4"] = ["g","h","i"]
keyboard["5"] = ["j","k","l"]
keyboard["6"] = ["m","n","o"]
keyboard["7"] = ["p","q","r","s"]
keyboard["8"] = ["t","u","v"]
keyboard["9"] = ["w","x","y","z"]

func getComb(_ str1:[String],_ str2:[String])->[String]{
	var combStr = [String]()
	
	for i in str1{
		var temp: String = ""
		
		temp.append(i)
		
		for j in str2{
			temp.append(j)
			combStr.append(temp)
			temp.removeLast()
		}
		
	}
	
	return combStr
}

var temp: String = ""
var tempStr = [String]()

if digits.count == 0{
	return tempStr
	//print(tempStr)
}else if digits.count == 1{
	return keyboard[String(digits[digits.startIndex])]
	//print(keyboard[String(digits[digits.startIndex])]!)
}else{
	for i in digits.indices{
		let inputStr = String(digits[i])

		if temp.count == 0{
			temp = inputStr//"2"
			continue
		}

		if tempStr.count  == 0{
			tempStr = getComb(keyboard[temp]!,keyboard[inputStr]!)
			continue
		} 

		tempStr = getComb(tempStr,keyboard[inputStr]!)
	}

	//print(tempStr)
	return tempStr
}

/*천재의 코드
func letterCombinations(_ digits: String) -> [String] {
        var combinations = [String]()
        for digit in Array(digits) {
            guard let number = Int(String(digit)),
                let letters = phoneDict[number] else {
                    continue
                }
            var newCombinations = [String]()
            for letter in Array(letters) {
                if combinations.count == 0 {
                    newCombinations.append(String(letter))  
                } else {
                    newCombinations += combinations.map({$0 + String(letter)})
                }
            }
            combinations = newCombinations
        }
        return combinations
    }
*/
