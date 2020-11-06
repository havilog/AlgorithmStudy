import java.util.ArrayList;
import java.util.List;

class Solution {
    public List<Integer> sequentialDigits(int low, int high) {
    	int sum=0;
    	String strlow = Integer.toString(low);
    	String strhigh = Integer.toString(high);
    	System.out.println(strlow.charAt(0));
    	//System.out.println(10-strlow.length());
    	int lownum = Integer.parseInt(strlow.charAt(0)+"");
    	int highnum = Integer.parseInt(strhigh.substring(0, (strhigh.length() - strlow.length())+1)+"");
    	/*for (int i=0; i<=(strhigh.length()-strlow.length());i++) {
    		
    	}*/
    	System.out.println(highnum+"//"+lownum);
    	//System.out.println((10-strlow.length())-Integer.parseInt(strlow.charAt(0)+"")+1);
    	List<Integer> t =  new ArrayList<Integer>();
        return t;
    }
}
public class Main5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution s = new Solution();
		s.sequentialDigits(1000, 13000);

	}

}
