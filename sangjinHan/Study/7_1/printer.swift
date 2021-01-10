
/*
priorities			location	return
[2, 1, 3, 2]			2		   1
[1, 1, 9, 1, 1, 1]		0	       5
*/
import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var dict = [Int:Int]()
    var temp = priorities
    var maxInt = -1
    var cnt = 0
    var index = 0
    
    for i in 0..<priorities.count {
        dict[i] = priorities[i] 
        maxInt = maxInt > priorities[i] ? maxInt : priorities[i]
        // print("dict[i] : \(dict[i]!), maxInt : \(maxInt),  priorities[i] : \( priorities[i]) ")
    }
    
    while true {        
        if dict[index]! < maxInt {
            index = (index + 1) % priorities.count
        }else {
            cnt += 1
            
            if index == location {
                break
            }
            dict[index]! = -1
            index = (index + 1) % priorities.count
            
            maxInt = 0
            for (_,value) in dict {
                maxInt = maxInt > value ? maxInt : value
            }
        }
    }
    
    return cnt
}