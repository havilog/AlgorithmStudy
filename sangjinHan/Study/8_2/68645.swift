import Foundation
/*
1
2 12
3 13 11
4 14 15 10
5 6 7 8 9

아래 오른 위 왼

5
5
4
3
2
1

x += 1, y += 0
x += 0, y += 1
x -= 1, y -= 1

0 0
1 0
2 0
3 0
3 1
3 2
3 3 
3 4
2 3
1 2
2 2

4 + 3 + 2 + 1
*/
func solution(_ n:Int) -> [Int] {
    let xArr = [1,0,-1]
    let yArr = [0,1,-1]
    var xdir: Int = 0
    var ydir: Int = 0
    var x: Int = 0
    var y: Int = 0
    var index: Int = 0
    var count: Int = n - 1
    var numArr: [Int] = []
    var temp: Int = 0
	var check: Bool = true
    var answer: [[Int]] = Array(repeating: Array(repeating: 0, count:n ), count :n )
	var realAnswer:[Int] = []
    
	//얘는 없어도.. 되네..?
    for i in (1...n).reversed() {
        temp += i
    }
    
	//얘도..?
    for i in 1...temp {
        numArr.append(i)
    }
    	
    while true {
        if index >= numArr.count { break }
		
		if count == 0 {
			answer[x][y] = numArr[index]
			break
		}
        
        for _ in 0..<count {
            if index >= numArr.count { break }
            answer[x][y] = numArr[index]
			// print("answer[x][y]: \(answer[x][y]), x: \(x), y:\(y)")
            x += xArr[xdir]
            y += yArr[ydir]
            index += 1	
        }
        
        xdir = (xdir+1)%3
        ydir = (ydir+1)%3
		
		if check {
			
		}else { 
			count -= 1
		}
        
		check = false
    }
	
	for i in 0..<n {
		for j in 0..<n {
			if answer[i][j] != 0 {
				realAnswer.append(answer[i][j])
			}
		}
	}
    
    return realAnswer
}

print(solution(6))


/*
import Foundation

func solution(_ n:Int) -> [Int] {
    var arr: [[Int]] = []

    for i in 1...n {
        arr.append(Array(repeating: 0, count: i))
    }

    var currentX = 0
    var currentY = 0
    var currentDirection = 0
    var currentValue = 1

    let dx = [0,1,-1]
    let dy = [1,0,-1]

    for l in (1...n).reversed() {

        for _ in 0..<(l-1) {
            arr[currentY][currentX] = currentValue
            currentValue += 1

            currentX += dx[currentDirection]
            currentY += dy[currentDirection]
        }

        arr[currentY][currentX] = currentValue
        currentValue += 1

        currentDirection += 1
        currentDirection %= 3

        currentX += dx[currentDirection]
        currentY += dy[currentDirection]
    }

    return arr.reduce(into: [Int]()) { $0.append(contentsOf: $1) }
}
*/