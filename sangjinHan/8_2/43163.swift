//단어 변환
/*
begin	target	words	return
hit	cog	[hot, dot, dog, lot, log, cog]	4
hit	cog	[hot, dot, dog, lot, log]	0
*/
import Foundation

let begin = "hit"
let target = "cog"
let words = ["hot", "dot", "dog", "lot", "log", "cog"]
// hit -> hot -> dot -> dog -> cog

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
	//target을 포함하고 있지 않을 때
	if !words.contains(target) {
		return 0
	}
	
	
	
    return 0
}

solution(begin,target,words)