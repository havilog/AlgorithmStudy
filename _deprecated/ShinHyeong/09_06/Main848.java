class Solution5 {
    public String shiftingLetters(String S, int[] shifts) {
    	StringBuilder str = new StringBuilder(S);
    	int sum = 0;
    	for (int i=(shifts.length-1);i>=0;i--) {
    		sum = (sum+shifts[i])%26;
    		int num = (int)str.charAt(i)+sum; 
    		if (num>122) {
				if ((num-122)%26==0) num = 122;
				else num = (num-122)%26+96;
			}
    		str.setCharAt(i, (char)num);
    	}
    	
    	return str.toString();
        
    }
}
// Runtime : 4ms || Memory : 41.8 MB
public class Main848 {

	public static void main(String[] args) {
		Solution5 s = new Solution5();
		s.shiftingLetters("abc", new int[] {3,5,9});
	}

}
