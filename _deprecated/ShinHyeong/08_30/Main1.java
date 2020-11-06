import java.util.Collections;
import java.util.HashMap;

class Solution1 {
    public int firstUniqChar(String s) {
    	int answer=-1;
    	HashMap<String, Integer> word = new HashMap<String, Integer>();
    	for (int i=0; i<s.length();i++) {
    		word.put( s.charAt(i)+"", word.getOrDefault(s.charAt(i)+"", 0)+1 );
    	}
    	// non-repeating이라는 것은 1개라는 것
    	if ((word.size()!=0)&&Collections.min(word.values())!=1) {
    		return -1;
    	}
    	for (int i=0; i<s.length();i++) {
    		if (word.get(s.charAt(i)+"")==1) {
    			answer = i;
    			break;
    		}
    	}
		return answer;
        
    }
}
public abstract class Main1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution1 s = new Solution1();
		System.out.println(s.firstUniqChar(""));

	}

}

/* 최대한 HashTable을 사용하려고 함 */
