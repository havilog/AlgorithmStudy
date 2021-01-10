/*
str1	str2	answer
FRANCE	french	16384
handshake	shake hands	65536
aa1+aa2	AAAA12	43690
E=M*C^2	e=m*c^2	65536
*/
//97~122
let str1 = "FRANCE"
let str2 = "french"

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    
    // 분리한 입력문자를 저장할 컨테이너
    var splitstr1 = [String]()
    var splitstr2 = [String]()
    
    // 각 요소의 개수가 몇 개씩 있는지 기록할 딕셔너리 준비
    var set1 = [String : Int]()
    var set2 = [String : Int]()
    
    var intersectSet: Int = 0     // 교집합 개수
    var unionSet: Int = 0     // 합집합 개수
    
    
    // 입력문자를 두개씩 분리
    for i in 0..<str1.count - 1 {
        // 대문자로 변환한 스트링을 앞에서부터 두 문자씩 빼옴
        let first = String(str1[str1.index(str1.startIndex, offsetBy: i)]).uppercased()
        let second = String(str1[str1.index(str1.startIndex, offsetBy: i + 1)]).uppercased()
        
        // 문자가 알파벳일때만 배열에 추가
        if "A" <= first && first <= "Z"
            && "A" <= second && second <= "Z" {
            splitstr1.append(first + second)
        }
    }
    
    // set1 작성
    for elem in splitstr1 {
        // 각 요소 개수세기
        let count = splitstr1.filter { $0 == elem }.count
        // 딕셔너리 형태로 저장
        set1[elem] = count
    }
    
    // 입력문자를 두개씩 분리
    for i in 0..<str2.count - 1 {
        // 대문자로 변환한 스트링을 앞에서부터 두 문자씩 빼옴
        let first = String(str2[str2.index(str2.startIndex, offsetBy: i)]).uppercased()
        let second = String(str2[str2.index(str2.startIndex, offsetBy: i + 1)]).uppercased()
        
        // 문자가 알파벳이면 추가
        if "A" <= first && first <= "Z"
            && "A" <= second && second <= "Z" {
            splitstr2.append(first + second)
        }
    }
    // set2 작성
    for elem in splitstr2 {
        // 각 요소 개수세기
        let count = splitstr2.filter { $0 == elem }.count
        // 딕셔너리 형태로 저장
        set2[elem] = count
    }
    
    
    // set1에 대해 set2를 비교
    for it in set1 {
        // set1의 키값이 set2에도 있으면
        if (set2[it.key] != nil) {
            // 작은값을 교집합에 추가
            intersectSet += min(it.value, set2[it.key]!)
            // 큰 값을 합집합에 추가
            unionSet += max(it.value, set2[it.key]!)
        } else {
            // 키값이 없으면 합집합에 set1 요소만 추가
            unionSet += it.value
        }
    }
    
    
    // set2에 대해 set1을 비교
    for it in set2 {
        // set1에 대응되는 값이 없으면
        if (set1[it.key] == nil) {
            // 합집합에 set2 요소만 추가
            unionSet += it.value
        }
    }
    
    // 예외처리
    if unionSet == 0 { return 65536 }
    // 답안 작성
    intersectSet *= 65536
    return intersectSet / unionSet
}

print(solution(str1,str2))