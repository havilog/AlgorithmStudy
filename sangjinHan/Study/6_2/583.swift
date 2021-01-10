//583. Delete Operation for Two Strings

/*
Input: "sea", "eat"
Output: 2
Explanation: You need one step to make "sea" to "ea" and another step to make "eat" to "ea".


"spake"
"park"
3

"food"
"money"
7

"sea"
"ate"
4

"intention"
"execution"
8

"algorithm"
"altruistic"
*/

let word1: String = "algorithm"
let word2: String = "altruistic"

/*
func minDistance(_ word1: String, _ word2: String) -> Int {
    var answer: Int = 0
	
	let length1: Int = word1.count
	let length2: Int = word2.count
	
	if length1 == 0 {
		return length2
	}else if length2 == 0 {
		return length1
	}
	
	var longS: [Character]
	var shortS: [Character]
	
	var temp = [Character]()
	var location:Int = -1
	
	if length1 > length2 {
		longS = Array(word1)
		shortS = Array(word2)
	}else {
		longS = Array(word2)
		shortS = Array(word1)
	}
	
	// print("longS : \(longS), shortS : \(shortS)")

	for i in 0..<longS.count {
		for j in location+1..<shortS.count {
			
			if longS[i] == shortS[j] && location < j {
				temp.append(shortS[j])
				location = j
				break
			}
		}
	}
	
	print(temp)
	
	answer = length1 + length2 - 2*temp.count
	
	return answer
}*/

//dfs solution
func minDistance(_ word1: String, _ word2: String) -> Int {
    guard word1.count > 0 else {
        return word2.count
    }
    guard word2.count > 0 else {
        return word1.count
    }
    var array = Array(repeating : Array(repeating : 0, count : word1.count + 1), count : word2.count + 1)
    var word1 = Array(word1)
    var word2 = Array(word2)
    for row in 0..<word2.count {
        for col in 0..<word1.count {
            if word2[row] == word1[col] {
                array[row + 1][col + 1] = 1 + array[row][col]
            } else {
                array[row + 1][col + 1] = max(array[row][col + 1], array[row + 1][col])
            }
        }
    }
    let common = array[array.count - 1][array[array.count - 1].count - 1]
    return (word1.count - common) + (word2.count - common)
}


print(minDistance(word1,word2))