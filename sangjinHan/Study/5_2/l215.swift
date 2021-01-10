//215. Kth Largest Element in an Array
/*
Example 1:

Input: [3,2,1,5,6,4] and k = 2
Output: 5

Example 2:

Input: [3,2,3,1,2,4,5,5,6] and k = 4
Output: 4
*/

let nums:[Int] = [3,2,3,1,2,4,5,5,6]
let k: Int = 4

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    let sortedNums = nums.sorted()
	
	return sortedNums[sortedNums.count - k]
}

print(findKthLargest(nums,k))