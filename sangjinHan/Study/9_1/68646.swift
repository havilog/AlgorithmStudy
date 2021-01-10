import Foundation
// 백만 nlogn 이하로
let a = [-16,27,65,-2,58,-92,-71,-68,-61,-33]

func solution(_ a:[Int]) -> Int {
    var answer = 0
    var arr1:[Int] = []
    var arr2:[Int] = a
    let size = a.count
    var target = -1000000001
    var min = 1000000001
    
    for i in 0..<size {
        target = a[i]
		
        arr2.removeFirst()
		
		if arr2.count == 0 { 
			answer += 1
			break
		}
		
        let min2 = arr2.min()!
        
        if arr1.count == 0 {
            answer += 1
			if min > target {
				min = target
			}
            arr1.append(target)
        }else {
            if min2 < target && min < target {
                arr1.append(target)
				if min > target {
					min = target
				}
                continue
            }else {
				if min > target {
					min = target
				}
				answer += 1
			}
        }
    }
    
    return answer
}

print(solution(a))