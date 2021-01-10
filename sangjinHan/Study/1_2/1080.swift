/*행렬*/
//배열 크기
let input = readLine()!.split(separator:" ").map{ Int($0)! }

//배열 선언
var arr1 = [[Int]]()
var arr2 = [[Int]]()
var answer = 0 

//배열 초기화
for _ in 0..<input[0]{
	let inputarr = Array(readLine()!).map{ Int(String($0))! }
	arr1.append(inputarr)
}

for _ in 0..<input[0]{
	let inputarr2 = Array(readLine()!).map{ Int(String($0))! }
	arr2.append(inputarr2)
}

//수정
if input[0] < 3 || input[1] < 3{
	if arr1 != arr2{
		print(-1)
	}else{
		print(answer)
	}
}else{
	for i in 0..<input[0]-2{
		for j in 0..<input[1]-2{
			if arr1[i][j] != arr2[i][j]{
				for k in 0..<3{
					for h in 0..<3{
						if arr1[i+k][j+h] == 0{
							arr1[i+k][j+h] = 1

						}else{
							arr1[i+k][j+h] = 0
						}	
					}
				}
				answer+=1
			}
		}
	}
	if arr1 != arr2{
		print(-1)
	}else{
		print(answer)
	}
}
