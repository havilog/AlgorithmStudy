class Solution {
    int sum=0,result=0;
    public int findTargetSumWays(int[] nums, int S) {
        dfs(nums,0,0,S);
        return result;
    }
    public void dfs(int[] nums, int count, int sum, int S) {
    	if (count==nums.length) {
    		if (sum==S) result++;
    		return;
    	}
    	this.dfs(nums, count+1, sum+nums[count],S);
    	this.dfs(nums, count+1, sum-nums[count],S);
    }
}