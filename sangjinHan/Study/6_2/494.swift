//494. Target Sum
/*
Input: nums is [1, 1, 1, 1, 1], S is 3. 
Output: 5
Explanation: 

-1+1+1+1+1 = 3
+1-1+1+1+1 = 3
+1+1-1+1+1 = 3
+1+1+1-1+1 = 3
+1+1+1+1-1 = 3

There are 5 ways to assign symbols to make the sum of nums be target 3.
*/

let nums: [Int] = [1, 1, 1, 1, 1]
let S: Int = 3


//Time: O(2^n), Space:O(m)
/*
func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
    var answer: Int = 0
	
	dfs(nums,S,0,0,&answer)
	
	return answer
}

func dfs(_ nums: [Int], _ S: Int, _ temp: Int , _ depth: Int, _ answer: inout Int){
	if nums.count == depth{
		if temp == S {
			answer += 1
		}
		
		return
	}
	dfs(nums,S,temp - nums[depth],depth+1,&answer)
	dfs(nums,S,temp + nums[depth],depth+1,&answer)
}
*/

//Time: O(n * t), Space:O(t)
/**/
func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
	let count = nums.count
	let sum = nums.reduce(0, +)
	if (S < -sum || S > sum) { return 0 } // impossible
	if (sum - S) % 2 == 1 { return 0 } // impossible

	let target = (sum - S) / 2 // we only need to find numbers that add up to this target

	var memo = Array(repeating: 0, count: target + 1)
	memo[0] = 1; 

	for num in nums {
		for curTarget in stride(from: target, through: 0, by: -1) {
			if curTarget >= num { // num is a possible candidate
				memo[curTarget] += memo[curTarget - num]
			}
		}
	}

	return memo[target]
}



print(findTargetSumWays(nums,S))