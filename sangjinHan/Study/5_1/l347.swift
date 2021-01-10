//347. Top K Frequent Elements

/*
Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]

Input: nums = [1], k = 1
Output: [1]
*/

let nums = [1,1,1,2,2,3]
let k = 2

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var dict = [Int:Int]()
	
	for num in nums{
		dict[num] = (dict[num] ?? 0) + 1
	}
	
    return Array(dict.sorted{ $0.value > $1.value }.map{ $0.key }[0..<k])
}

print(topKFrequent(nums,k))
