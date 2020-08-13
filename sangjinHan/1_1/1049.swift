let input = readLine()!.split(separator:" ").map{Int($0)!}

var myset = input[0]/6
let single = input[0]%6

var minPrice = 0

var minPackage = Int.max
var minSingle = Int.max

for _ in 0..<input[1]{
	let prices = readLine()!.split(separator:" ").map{Int($0)!}
	
	minPackage = min(minPackage, prices[0])
	minSingle = min(minSingle, prices[1])
}

if minPackage > minSingle * 6 {
	print(input[0] * minSingle)
}else{
	minPrice += myset * minPackage
	
	if single * minSingle > minPackage{
		minPrice += minPackage
	}else{
		minPrice += single * minSingle
	}
	
	print(minPrice)
}