
//848. Shifting Letters

/*
Input: S = "abc", shifts = [3,5,9]
Output: "rpl"
Explanation: 
We start with "abc".
After shifting the first 1 letters of S by 3, we have "dbc".
After shifting the first 2 letters of S by 5, we have "igc".
After shifting the first 3 letters of S by 9, we have "rpl", the answer.

"bad"
[10,20,30]
*/

let S: String = "abc"
let shifts: [Int] = [3,5,9]

func shiftingLetters(_ S: String, _ shifts: [Int]) -> String {
	var arr = Array(S)	
	var sum = 0
    var newShifts = [Int]()
    for shift in shifts{
        newShifts.append(shift%26)
        sum += newShifts.last!
    }
    
    for i in 0..<newShifts.count{
        let asciiVal = ( Int(arr[i].asciiValue!) - 97 + sum ) % 26 + 97
		let char = Character(UnicodeScalar(asciiVal)!)
		arr[i] = char
        sum -= newShifts[i]
    }
	
	return String(arr)
	
}

print(shiftingLetters(S,shifts))

//Smarter and Faster solution
/*
class Solution {
    func shiftingLetters(_ S: String, _ shifts: [Int]) -> String {
        var chars = Array(S)
        var i = shifts.count - 1
        var sum = 0
        while i >= 0 {
            sum += shifts[i]
            chars[i] = Character(Unicode.Scalar(((Int(chars[i].asciiValue!) - 97) + sum) % 26 + 97)!)
            i -= 1
        }
        return String(chars)
    }
}
*/

//n^2
// for i in 0..<shifts.count {
// 	for j in 0...i {
// 		myShifts[j] += shifts[i]
// 		print(shifts[i])
// 	}
// }
// // print(myShifts)

// for i in 0..<shifts.count {
// 	let asciiVal = ( Int(arr[i].asciiValue!) - 97 + myShifts[i] ) % 26 + 97
// 	let char = Character(UnicodeScalar(asciiVal)!)
// 	arr[i] = char
// }



// n^2
// for i in 0..<shifts.count {
// 	// print(i)
// 	for j in 0...i {
// 		let asciiVal = ( Int(arr[j].asciiValue!) - 97 + shifts[i] ) % 26 + 97
// 		print("asciiVal = \(asciiVal)")
// 		let char = Character(UnicodeScalar(asciiVal)!)
// 		print("char = \(char)")
// 		arr[j] = char
// 		// print("i : \(i),j : \(j)")
// 	for j in 0...i {
// }

// print(arr)

// answer = String(arr)