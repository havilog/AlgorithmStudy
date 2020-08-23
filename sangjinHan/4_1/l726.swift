//726. Number of Atoms

/*
Input: 
formula = "H2O"
Output: "H2O"
Explanation: 
The count of elements are {'H': 2, 'O': 1}.

Input: 
formula = "Mg(OH)2"
Output: "H2MgO2"
Explanation: 
The count of elements are {'H': 2, 'Mg': 1, 'O': 2}.

Input: 
formula = "K4(ON(SO3)2)2"
Output: "K4N2O14S4"
Explanation: 
The count of elements are {'K': 4, 'N': 2, 'O': 14, 'S': 4}.
*/


let input: String = "Be32"
let inputArr = Array(input)
let num:[String] = ["1","2","3","4","5","6","7","8","9"]
let smallAlpha:[String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

var dict = [[String:Int]]()
var tempDict = [String:Int]()

var cnt = 0

for i in 0..<inputArr.count{
	if smallAlpha.contains(String(inputArr[i])){ continue }
	
	if (i != inputArr.count-1) && num.contains(String(inputArr[i])) && num.contains(String(inputArr[i+1])){
		
	}
	
	if inputArr[i] == "("{
		dict.append(tempDict)
		cnt += 1
		tempDict.removeAll()
		continue
	}else if inputArr[i] == ")"{
		dict.append(tempDict)
		tempDict.removeAll()
	}else if num.contains(String(inputArr[i])) && inputArr[i-1] != ")"{
		tempDict[String(inputArr[i-1])] = Int(String(inputArr[i]))!
	}else if num.contains(String(inputArr[i])) && inputArr[i-1] == ")"{
		for key in dict[cnt].keys{
			dict[cnt][key] = dict[cnt][key]! * Int(String(inputArr[i]))!
		}
		
		for (key,value) in dict[cnt]{
			if dict[cnt-1][key] ?? 0 > 0{
				dict[cnt-1][key]! += value
			}else{
				dict[cnt-1][key] = value
			}
		}
		
		cnt -= 1
	}else{
		if (i != inputArr.count-1) && smallAlpha.contains(String(inputArr[i+1])){
			var tempString:String = "" 
			tempString += String(inputArr[i])
			tempString += String(inputArr[i+1])
			
			tempDict[tempString] = tempDict[tempString] ?? 0 + 1
		}else{
			tempDict[String(inputArr[i])] = tempDict[String(inputArr[i])] ?? 0 + 1	
		}
	}
}

if !tempDict.isEmpty{
	dict.append(tempDict)
}

print(dict)

var answer = ""

let sortedDict = dict[0].sorted{ $0.key < $1.key }

for (key,value) in sortedDict{
	answer += key
	if value != 1{
		answer += String(value)	
	}
}

print(answer)