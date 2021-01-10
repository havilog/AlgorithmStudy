func solution(_ dirs:String) -> Int {
	var node = [0,0]
	var graph = [[[Int]]]()
		
	for index in dirs.indices {
		var temp = [Int]()
		var edge = [[Int]]()
		var check = false
		
		temp.append(node[0])
		temp.append(node[1])
		
		switch dirs[index] {
			case "U":
				if node[1] < 5 {
					node[1] += 1
				} else {
					check = true
				}
				break
			case "D":
				if node[1] > -5 {
					node[1] -= 1
				} else {
					check = true
				}
				break
			case "L":
				if node[0] > -5 {
					node[0] -= 1
				} else {
					check = true
				}
				break
			case "R":
				if node[0] < 5 {
					node[0] += 1
				} else {
					check = true
				}
				break
			default:
				break
		}
		
		if check { continue }
		
		edge.append(temp)
		
		temp.removeAll()
		
		temp.append(node[0])
		temp.append(node[1])
		
		edge.append(temp)
		
		graph.append(edge)
	}
	
	print(graph)
	
	for index in graph.indices {
		graph[index].sort{ 
			if $0[0] == $1[0] {
				return $0[1] < $1[1]
			} else {
				return $0[0] < $1[0]
			}
		}
	}
	
	return Set(graph).count
}

let dirs = "LULLLLLLUDRRRRRRRRRRR"

print(solution(dirs))


/*
func solution(_ dirs:String) -> Int {
	var node = (0,0)
	var edge = [[(Int,Int)]]()
		
	for index in dirs.indices {
		var temp = [(Int,Int)]()
		
		temp.append(node)
		
		switch dirs[index] {
		case "U":
			node.1 += 1
			break
		case "L":
			node.0 -= 1
			break
		case "R":
			node.0 += 1
			break
		case "D":
			node.1 -= 1
			break
		default:
			break
		}
		
		temp.append(node)
		
		edge.append(temp)
	}
	
	print(edge[0] == edge[1])
	
	return 0
}

let dirs = "ULURRDLLU"

print(solution(dirs))
*/