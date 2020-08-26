//1. Two Sum
/*
Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
*/

let nums:[Int] = [3,2,4];
let target:Int = 6;

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
	var answer = [Int]()
	var dict = [Int:Int]()
	
	for (i,num) in nums.enumerated(){
		if let index = dict[target-num]{
			answer.append(index)
			answer.append(i)
		}
		dict[num] = i
	}
	
    return answer
}

print(twoSum(nums,target))