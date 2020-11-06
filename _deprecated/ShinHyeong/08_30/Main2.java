import java.util.ArrayList;
import java.util.Collections;

class Solution2 {
    public int findKthLargest(int[] nums, int k) {
    	ArrayList<Integer> numlist = new ArrayList<>();
    	for (int i=0; i<nums.length;i++) {
    		numlist.add(nums[i]);
    	}
    	Collections.sort(numlist);
    	return numlist.get(numlist.size()-k);
    }
}
public class Main2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution2 s = new Solution2();
		int[] num = {3,2,1,5,6,4};
		int[] num1 = {};
		s.findKthLargest(num1, 4);

	}

}
