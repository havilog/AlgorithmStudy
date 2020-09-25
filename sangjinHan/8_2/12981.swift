/*

n	words	result
3	["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]	[3,3]
5	["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"]	[0,0]
2	["hello", "one", "even", "never", "now", "world", "draw"]	[1,3]

*/
let n = 3
let words = ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
	var num = 0
	var dict:[String:Int] = [:]
	var answer:[Int] = []
	for index in words.indices {
		dict[words[index],default:0] += 1
		
		if dict[words[index]]! > 1 {
			// print("dict")
			num = index
			break
		}
		
		if index + 1 == words.count { break }
		
		if words[index].last! != words[index+1].first! {
			// print("wrong")
			num = index + 1
			break
		}
	}
	
	answer.append(num%n + 1)
	answer.append(num/n + 1)
	
    return answer
}

print(solution(n,words))