import java.util.ArrayList;
import java.util.Collections;

class Solution {
    public int kthSmallest(int[][] matrix, int k) {
    	ArrayList<Integer> list = new ArrayList<>();
    	for (int i=0; i<matrix.length;i++) {
    		for (int j=0; j<matrix[i].length;j++) {
    			list.add(matrix[i][j]);
    		}
    	}
    	Collections.sort(list);
    	System.out.println(list);
    	System.out.println(list.get(k-1));
        return 0;
    }
}
public class Main3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution s = new Solution();
		int[][] matrix = {{ 1,  5,  9},{10, 11, 13},{12, 13, 15}};
		//int[][] matrix1 = {{ 1, 5,9,18},{10, 11, 13,19},{12, 13, 15,20},{12, 13, 15,20}};
		s.kthSmallest(matrix, 8);

	}

}
