// 알고리즘 잘못 푼듯
/*
helo
ehlo
lheo
등 의 반례가 부족함

nCk로 풀어야하는듯 함
*/

let input = readLine()!.split(separator:" ").map{Int($0)!}
let N = input[0]
let K = input[1]

var canRead = input[1]-5
var answer = 0

var answerArr = [[Character]]()
var teachArr = [[Any]]()


let first = "anta"
let end = "tica"


let alpha : [Character] = -["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
//이 부분 선언 간단하게 할 수 있는 방법 있을 듯

var check : [Bool] = Array(repeating:false,count:alpha.count)


check[Int(alpha[0].asciiValue!-alpha[0].asciiValue!)]=true//a
check[Int(alpha[2].asciiValue!-alpha[0].asciiValue!)]=true//c
check[Int(alpha[8].asciiValue!-alpha[0].asciiValue!)]=true//n
check[Int(alpha[13].asciiValue!-alpha[0].asciiValue!)]=true//i
check[Int(alpha[19].asciiValue!-alpha[0].asciiValue!)]=true//t


/*
[
[r,c],
[h,e,l,l,o],
[s,d,f],
[q,z,d,f,c,g]
]

-->

r
hello
r
sdf
qzdfc


helo
sdf
qzdfc
r
rf
*/

var inputArr = [String]()
var charArr = [[Character]]()

for i in 0..<N{
	inputArr.append(readLine()!)
	charArr.append(Array(inputArr[i]))
}

for i in 0..<N{
	for _ in 0..<4{
		charArr[i].removeFirst()
		charArr[i].removeLast()
	}
}


for i in 0..<N{
	var temp = Set<Character>()
	for j in 0..<charArr[i].count{
		if(charArr[i][j] == "a" || charArr[i][j] == "c" || charArr[i][j] == "i" || charArr[i][j] == "n" || charArr[i][j] == "t"){
			continue
		}
		temp.insert(charArr[i][j])
	}
	teachArr.append(Array(temp))
}



// for i in teachArr{
// 	answerArr.append(Array(i))
// }

// answerArr.sort{$0.count < $1.count}
teachArr.sort{$0.count < $1.count}

print(teachArr)

for i in 0..<N{
	//가르칠 수 있는 글자보다 많을 때
	if teachArr[i].count>K-5{
		break
	}
	
	for j in 0..<teachArr[i].count{
		if check[Int((teachArr[i][j] as! Character).asciiValue!-alpha[0].asciiValue!)]{
			continue
		}else{
			check[Int((teachArr[i][j] as! Character).asciiValue!-alpha[0].asciiValue!)] = true
			canRead -= 1
		}
	}
	
	if canRead < 0{
		break
	} 
	
	answer = i+1
}

print(answer)

/*
5 9
antarctica
antahellotica
antacartica
antasdftica
antaqwertyitica
*/