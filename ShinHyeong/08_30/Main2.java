import java.util.ArrayList;
import java.util.Collections;

class Solution2 {
    public int findKthLargest(int[] nums, int k) {
    	ArrayList<Integer> numlist = new ArrayList<>();
    	for (int i=0; i<nums.length;i++) {
    		numlist.add(nums[i]);
    	}
    	Collections.sort(numlist);
    	System.out.println(numlist.get(numlist.size()-k));
    	
    	return 0;
    }
}
public class Main2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution2 s = new Solution2();
		int[] num = {3,2,1,5,6,4};
		int[] num1 = {};
		s.findKthLargest(num1, 4);
		//System.out.println(s.findKthLargest(num, 2));

	}

}
