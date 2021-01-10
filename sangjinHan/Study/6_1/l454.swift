//454. 4Sum II

/*
Input:
A = [ 1, 2]
B = [-2,-1]
C = [-1, 2]
D = [ 0, 2]

Output:
2

Explanation:
The two tuples are:
1. (0, 0, 0, 1) -> A[0] + B[0] + C[0] + D[1] = 1 + (-2) + (-1) + 2 = 0
2. (1, 1, 0, 0) -> A[1] + B[1] + C[0] + D[0] = 2 + (-1) + (-1) + 0 = 0
*/

let A = [-1,-1]
let B = [-1,1]
let C = [-1,1]
let D = [1,-1]

// func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
// 	var answer: Int = 0
// 	var sumArr = [[Int]]()	
// 	sumArr.append(A)
// 	sumArr.append(B)
// 	sumArr.append(C)
// 	sumArr.append(D)
	
// 	dfs(sumArr,0,0,&answer)
	
// 	return answer
// }

// func dfs(_ arr: [[Int]], _ sum: Int, _ depth: Int, _ answer: inout Int){
// 	if depth == arr.count - 1{ 
// 		for i in 0..<arr[depth].count{
// 			if sum + arr[depth][i] == 0{
// 				answer += 1
// 			}
// 		}
// 		return
// 	}	
	
// 	for i in 0..<arr[0].count{
// 		dfs(arr,sum+arr[depth][i],depth+1,&answer)
// 	}
	
// }


func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
	var answer: Int = 0
	var dictAB = [Int:Int]()

	for a in A{
		for b in B{
			dictAB[a+b, default : 0] += 1 
		}
	}
	
	for c in C{
		for d in D{
			if let complementCount = dictAB[-c-d]{
				answer += complementCount
			}
		}
	}
	
	return answer
}

print(fourSumCount(A,B,C,D))