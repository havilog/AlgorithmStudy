import Foundation

func solution(_ grades:[String]) -> [String] {
    var newG = [[String]]()
    let num = ["A+" : 0, "A0" : 1, "A-" : 2, "B+" : 3, "B0": 4, "B-": 5, "C+": 6, "C0": 7, "C-": 8, "D+": 9, "D0": 10, "D-": 11, "F": 12]
    var dict = [String:(String,Int)]()
    
    for (index,grade) in grades.enumerated() {
        var splited = grade.components(separatedBy: " ")
        if dict[splited[0]] != nil {
            if num[dict[splited[0]]!.0]! > num[splited[1]]! {
                dict[splited[0]] = (splited[1],index)
            }
        } else {
            dict[splited[0]] = (splited[1],index)
        }
    }
    
    let answer = dict.sorted{
        if $0.value.0 == $1.value.0 {
            return $0.value.1 < $1.value.1
        } else {
            return num[$0.value.0]! < num[$1.value.0]!
        }
    }.map{ $0.key + " " + $0.value.0 }
            
    return answer
}