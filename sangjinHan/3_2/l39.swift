//39. Combination Sum
/*
[
  [7],
  [2,2,3]
]
*/
/*
Input: candidates = [2,3,5], target = 8,
A solution set is:
[
  [2,2,2,2],
  [2,3,3],
  [3,5]
]
*/

let candidates = [2,3,6,7]
let target = 7

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var answer = [[Int]]()
	var temp = [Int]()
	
	DFS(candidates.sorted(),target,&answer,&temp,0)
	
	return answer
}

func DFS(_ candidates: [Int], _ remain: Int,_ answer: inout [[Int]], _ temp: inout [Int], _ depth: Int){
	if remain < 0 {
        return
    } else if remain == 0 {
        answer.append(temp)
    } else {
        for i in depth..<candidates.count {
            temp.append(candidates[i])
            DFS(candidates, remain - candidates[i], &answer, &temp, i)
            temp.removeLast()
        }
    }
}

print(combinationSum(candidates,target))
