let input = readLine()!.split(separator:" ").map{ "\($0)" }
var answer = 1000000


for i in 0...(input[1].count-input[0].count){
	var cnt = 0
	for j in 0..<input[0].count{
		if Array(input[0])[j] != Array(input[1])[i+j]{
			cnt+=1
		}
	}
	answer = min(answer,cnt)
}

print(answer)