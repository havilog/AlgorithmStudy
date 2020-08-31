//55. Jump Game

/*

Example 1:

Input: nums = [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
Example 2:

Input: nums = [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.

*/
let nums:[Int] = [5,9,3,2,1,0,2,3,3,1,0,0]

func canJump(_ nums: [Int]) -> Bool {
    
    if nums.count <= 0 { return false }
    
    var maxJump = 0
    for i in nums.indices {
        if (i <= maxJump) {
            maxJump = max(maxJump, i + nums[i])
        }
    }
    
    return maxJump >= nums.count - 1
}

print(canJump(nums))