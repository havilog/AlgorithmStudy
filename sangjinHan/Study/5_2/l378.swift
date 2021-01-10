//378. Kth Smallest Element in a Sorted Matrix
/*
matrix = [
   [ 1,  5,  9],
   [10, 11, 13],
   [12, 13, 15]
],
k = 8,


[[-5]]
1

return 13.
*/

let matrix = [
	[1,10,100],
	[2,3,4],
	[5,6,7]
]

let k = 6

//이분탐색
func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
	func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        var left = matrix[0][0]
        var right = matrix[matrix.count - 1][matrix[0].count - 1] + 1
        var middle = 0
        var count = 0
        var j = matrix[0].count - 1

        while left < right {
            middle = left + (right - left) / 2
            count = 0
            j = matrix[0].count - 1
            for i in 0..<matrix.count {
                while j >= 0 && matrix[i][j] > middle {
                    j -= 1
                }
                count += (j + 1)
            }
            if count < k {
                left = middle + 1
            } else {
                right = middle
            }
        }
        
        return left
    }
}

/* 다 넣고 정렬
func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
	var answer:Int = 0
	var temp = [Int]()
	for i in 0..<matrix.count{
		for j in 0..<matrix.count{
			temp.append(matrix[i][j])
		}
	}
	
	temp.sort()
	
	answer = temp[k-1]
	
	return answer
}
*/

print(kthSmallest(matrix,k))