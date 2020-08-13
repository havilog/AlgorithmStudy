//k = 2
//w = 10, 15
//w/k = x (20)
//

// k = 3
// w = 5, 7, 10
// w / k = w/3

var lope = [Int]()
var answer : Int = 0

for _ in 0..<Int(readLine()!)!{
	lope.append(Int(readLine()!)!)
}

lope.sort()

for i in 0..<lope.count{
	if(answer<lope[i]*(lope.count-i)){
		answer = lope[i]*(lope.count-i)
	}
}

print(answer)
