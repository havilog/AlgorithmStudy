//1291. Sequential Digits
/*
Example 1:

Input: low = 100, high = 300
Output: [123,234]
Example 2:

Input: low = 1000, high = 13000
Output: [1234,2345,3456,4567,5678,6789,12345]

367 783
456, 567, 678

1000000000
*/

let low = 1000
let high = 13000

func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
    var answer = [Int]()
	
	for i in 1..<10 {
		var num = i
		var next = i
		
		while (num <= high && next < 10) {
			if num >= low {
				answer.append(num)
			}
			
			next += 1
			num = num * 10 + next
		}
	}
	
	answer.sort()
	
	return answer
}


print(sequentialDigits(low,high))