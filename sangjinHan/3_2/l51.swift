//51. N-Queens

//지나온 길, 갈 수 있는 길, 

var answer = [[String]]()

func solveNQueens(_ n: Int) -> [[String]] {
	let temp:[String] = Array(repeating:".", count:n)//[".", ".", ".", "."]
    let tempStr:[[String]] = Array(repeating: temp,count: n)
	//[[".", ".", ".", "."], [".", ".", ".", "."], [".", ".", ".", "."], [".", ".", ".", "."]]
	
	for i in 0..<tempStr.count{
		DFS(n,tempStr,i)
	}
	
	return answer
}

func DFS(_ n:Int,_ arr:[[String]],_ index:Int){
	var answerStr = [String]()
	var DFSStr:[[String]] = arr
	var check:Bool = true
	
	DFSStr[0][index] = "Q"
	
	for i in 1..<DFSStr.count{
		for j in 0..<DFSStr[i].count{
			
			for x in 0..<j{
				if DFSStr[]
			}
			
			if j == 0{
				if (DFSStr[i-1][j+1] != "Q") && (DFSStr[i-1][j] != "Q"){
					DFSStr[i][j] = "Q"
					break
				}
			}else if j==DFSStr[i].count-1{
				if (DFSStr[i-1][j-1] != "Q") && (DFSStr[i-1][j] != "Q"){
					DFSStr[i][j] = "Q"
					break
				}
			}else{
				if (DFSStr[i-1][j-1] != "Q") && (DFSStr[i-1][j] != "Q") && (DFSStr[i-1][j+1] != "Q"){
					DFSStr[i][j] = "Q"
					break
				}
			}
		}
	}
	
	print(DFSStr)
	
	if check{
		for i in 0..<DFSStr.count{
			answerStr.append(DFSStr[i].joined())
		}

		answer.append(answerStr)
		return
	}else{
		return
	}
}

print(solveNQueens(4))