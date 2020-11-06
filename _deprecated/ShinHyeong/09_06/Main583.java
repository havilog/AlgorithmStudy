class Solution {
    public int minDistance(String word1, String word2) {
    	int n = word1.length();
    	int m = word2.length();
    	int[][] distance = new int[n+1][m+1];
    	for (int i=0; i<=n; i++) {
    		for (int j=0; j<= m;j++) {
    			if (i==0) distance[i][j] = j;
    			else if (j==0) distance[i][j] = i;
    			else {
    				if (word1.charAt(i-1)==word2.charAt(j-1)) distance[i][j] = distance[i-1][j-1];
    				else distance[i][j] = Math.min(distance[i][j-1]+1, distance[i-1][j]+1);
    			}
    		}
    	}
        return distance[n][m]; // 왜 이게 정답인지는 잘 모르겠음
        
    }
}
public class Main583 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution s = new Solution();
		//s.minDistance("sea", "eat");
		System.out.println(s.minDistance("", ""));

	}

}
