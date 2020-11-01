import Foundation

import Foundation

func solution(_ encrypted_text:String, _ key:String, _ rotation:Int) -> String {
    var asciiKey = Array(key).map{ Int($0.asciiValue!)-96 }
    let encypt = Array(encrypted_text).map{ Int($0.asciiValue!) }

    var encodedStr = [Int]()

    let rotatedStr = rotate(encypt,rotation)


    for (index,char) in rotatedStr.enumerated() {

        let newChar = (char - asciiKey[index]) < 97 ? (char - asciiKey[index]) + 26 : (char - asciiKey[index])

        encodedStr.append(newChar)
    }

    let answer = encodedStr.map{ String(UnicodeScalar($0)!) }.joined()

    return answer
}

func rotate(_ arr: [Int], _ num: Int) -> [Int] {
    var returnArr = arr

    var shotNum = num % arr.count

    if shotNum < 0 {
        let newNum = -shotNum
        var slice = Array(returnArr[(arr.count-newNum)...])

        returnArr.removeSubrange((arr.count-newNum)...)
        slice += returnArr

        returnArr = slice
    } else if shotNum > 0 {
        let slice = Array(returnArr[0..<shotNum])
    
        returnArr.removeSubrange(0..<shotNum)
        returnArr += slice
    }

    return returnArr
}

// print(solution("asdqweqwe","abcdefghi", 10))

//	"qyyigoptvfb","abcdefghijk", 3

