/*
progresses	speeds	return
[93, 30, 55]	[1, 30, 5]	[2, 1]
[95, 90, 99, 99, 80, 99]	[1, 1, 1, 1, 1, 1]	[1, 3, 2]
*/

let progresses = [93, 30, 55]
let speeds = [1, 30, 5]

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
	var answer = [Int]()
	var myP = progresses
	var myS = speeds
	while true {
		if myP.count == 0 { break }
		
		for i in 0..<myP.count {
			myP[i] += myS[i]
		}
		
		var cnt = 0
		
		if myP[0] >= 100 {
			while true {
				if myP.count == 0 { break }
				if myP[0] < 100 { break }
				
				cnt += 1
				
				myP.remove(at:0)
				myS.remove(at:0)
			}
			
			answer.append(cnt)
		}
	}
	
    return answer
}

print(solution(progresses,speeds))