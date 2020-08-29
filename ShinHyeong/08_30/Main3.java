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
        return list.get(k-1);
    }
}
public class Main3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution s = new Solution();
		int[][] matrix = {{ 1,  5,  9},{10, 11, 13},{12, 13, 15}};
		s.kthSmallest(matrix, 8);

	}

}
