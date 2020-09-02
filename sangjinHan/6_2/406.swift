//406. Queue Reconstruction by Height
/*
Input:
[[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]

Output:
[[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
*/

let people = [[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]

func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
	var answer = [[Int]]()
	let sortedPeople = people.sorted( by: {
		if $0[0] == $1[0] {
			return $0[1] < $1[1]
		}
		
		return $0[0] > $1[0] }  
	)
	
	print(sortedPeople)
	
	for p in sortedPeople {
        answer.insert(p, at: p[1])
    }
	
	return answer
}

print(reconstructQueue(people))