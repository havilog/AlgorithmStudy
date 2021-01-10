// import Foundation
// let input = ["abc1233456defg123.jpg", "img10.png", "img02.png","img1.png", "IMG01.GIF", "img2.JPG"]
// // let input = ["F-5 Freedom Fighter", "B-50 Superfortress","A-10 Thunderbolt II","F-14 Tomcat"]

// func solution(_ files:[String]) -> [String] {
// 	var myfile = files
//     var tempString:[[String]] = [[]]
//     var answer:[String] = []
	
    
//     for file in myfile {
//         var head:String = ""
// 		var number:String = ""
// 		var tail:String = ""
// 		var check = false 
		
//         for text in file {
//             let ascii = Int(text.asciiValue!)
//             if !check && (ascii >= 48 && ascii <= 59) {
//                 number += String(text)
//                 check = true
//             } else if check && (ascii >= 48 && ascii <= 59) {
//                 number += String(text)
//                 check = true
//             } else if check && !(ascii >= 48 && ascii <= 59) {
//                 break
//             } else {
//                 head += String(text)
//             }
            
//             if number.count >= 5 { break }
			
// 			print("number : \(number)")
//         }
             
//         var str:[String] = []
//         str.append(head)
//         str.append(number)
		
// 		if tail.count > 0 {
// 			str.append(tail)
// 		} 
		
//         tempString.append(str)
//     }
//     tempString.removeFirst()
    
//     let sortedString = tempString.sorted { 
// 		if ($0[0]).lowercased != ($1[0]).lowercased {
// 			return $0[0] < $1[0]
// 		} else if Int($0[1])! != Int($1[1])! {
// 			 return Int($0[1])! < Int($1[1])!
// 		} else {
// 			return false
// 		}
// 	}
	
// 	for str in sortedString {
// 		answer.append(str.joined(separator:""))
// 	}
   
    
//     return answer
// }

// print(solution(input))


/*

struct Filename {
  let head: String
  let number: String
  let tail: String

  var filename: String { return "\(head)\(number)\(tail)" }
}

func solution(_ files:[String]) -> [String] {
  let filenames = files.map { filename -> Filename in
    var filenameCharacters = Array(filename)

    let firstNumberIndex = filenameCharacters.firstIndex { $0.isNumber }
    let head = filenameCharacters[0 ..< firstNumberIndex!].reduce("") { $0 + "\($1)" }
    filenameCharacters.removeFirst(firstNumberIndex!)

    let secondCharacterIndex = filenameCharacters.firstIndex { !$0.isNumber } ?? filenameCharacters.count
    let number = filenameCharacters[0 ..< secondCharacterIndex].reduce("") { $0 + "\($1)" }
    filenameCharacters.removeFirst(secondCharacterIndex)

    let tail = filenameCharacters.reduce("") { $0 + "\($1)" }

    let file = Filename(head: head, number: number, tail: tail)

    return file
  }

  let sorted = filenames.enumerated().sorted { first, second in
    let firstHead = first.element.head.lowercased()
    let secondHead = second.element.head.lowercased()
    if firstHead == secondHead {
      let firstNumber = Int(first.element.number)!
      let secondNumber = Int(second.element.number)!
      if firstNumber == secondNumber {
        return first.offset < second.offset
      } else {
        return firstNumber < secondNumber
      }
    } else {
      return firstHead < secondHead
    }
  }

  return sorted.map { $0.element.filename }
}
*/



import Foundation

struct FileInfomation {
    var head: String
    var number: String
    var fullName: String
}
func solution(_ files:[String]) -> [String] {
    var fileList = [FileInfomation]()
    var result = [String]()

    files.forEach { file in
        let fileRange = NSRange(file.startIndex..., in: file)
        let numberRegex = try! NSRegularExpression(pattern: "[0-9]+", options: [])
        let matchData = numberRegex.firstMatch(in: file, options: [], range: fileRange)
        let number = matchData.map { String(file[Range($0.range, in: file)!]) }!

        let fileCharArray = file.map { String($0) }
        let head = fileCharArray[0...matchData!.range.lowerBound - 1].joined()
        let fileInfomation = FileInfomation(head: head, number: number, fullName: file)
        fileList.append(fileInfomation)
    }

    fileList.forEach {  _ in
        fileList.enumerated().forEach { (index, _) in
            if index < fileList.count - 1 {
                if fileList[index].head.lowercased() == fileList[index + 1].head.lowercased() {
                    if Int(fileList[index].number)! > Int(fileList[index + 1].number)! {
                        fileList.swapAt(index, index+1)
                    }
                }  else {
                    if fileList[index].head.lowercased() > fileList[index + 1].head.lowercased() {
                        fileList.swapAt(index, index + 1)
                    }
                }
            }
        }
    }

    fileList.forEach { (fileInfomation) in
        result.append(fileInfomation.fullName)
    }
    return result
}

