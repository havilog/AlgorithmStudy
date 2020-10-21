package LEET;

public class LEET_494_Target_Sum {
    public static int result;
    public static int findTargetSumWays(int[] nums, int S) {
        result = 0;
        dfs(0, 0, nums, S);

        return result;
    }

    public static void dfs(int sum, int cnt, int nums[], int S) {
        if(cnt >= nums.length){
            if(sum == S) result++;
            return;
        }

        dfs(sum + nums[cnt], cnt + 1, nums, S);
        dfs(sum - nums[cnt], cnt + 1, nums, S);
    }
}
