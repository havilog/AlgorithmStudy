class Solution {
    public int findTargetSumWays(int[] nums, int S) {
        return dfs(nums, S, 0, 0);
    }
    
    private int dfs(int[] nums, int S, int index, int sum) {
        if (index == nums.length) {
            return S == sum ? 1 : 0;
        }
        
        return dfs(nums, S, index + 1, sum + nums[index]) +
               dfs(nums, S, index + 1, sum - nums[index]);
    }
}