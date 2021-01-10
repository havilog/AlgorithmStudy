//77. Combinations
/*
Input: n = 4, k = 2
Output:
[
  [2,4],
  [3,4],
  [2,3],
  [1,2],
  [1,3],
  [1,4],
]

Input: n = 1, k = 1
Output: [[1]]
*/
func combine(_ n: Int, _ k: Int) -> [[Int]] {
	let inputArr = Array(1...n)
	var answer = [[Int]]()
	var temp = [Int]()
	
	DFS(&answer,&temp,inputArr,k,0)
	
	return answer
}

private func DFS(_ answer: inout [[Int]], _ temp: inout [Int], _ inputArr:[Int], _ k:Int, _ depth:Int){
	if temp.count == k{
		answer.append(temp)
		return
	}else{
		for i in depth..<inputArr.count{
			if inputArr[i] > temp.last ?? 0{
				temp.append(inputArr[i])
				DFS(&answer,&temp,inputArr,k,depth+1)
				temp.removeLast()	
			}
		}
	}
}

print(combine(4,2))