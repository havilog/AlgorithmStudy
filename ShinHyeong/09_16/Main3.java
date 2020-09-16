import java.util.Arrays;
import java.util.Stack;

class Solution2 {
    public int[] solution(int[] progresses, int[] speeds) {
    	int[] amount = new int[progresses.length+1];
    	amount[progresses.length]=-1;
    	for (int i=0; i<progresses.length;i++) {
    		amount[i]=((100 - progresses[i]) % speeds[i] == 0 ? (100 - progresses[i]) / speeds[i] : (100 - progresses[i]) / speeds[i] + 1);
    	}
    	Stack<Integer> stack = new Stack<>();
    	for (int i=0; i<(amount.length-1);) {
    		int j=(i+1);
    		/*if (j<amount.length) {
    			while(amount[j]<amount[i]) {
    				j++;
    			}
    			stack.push(amount[i]);
    		}
    		else {*/
    			/* 마지막 칸을 채우면 됨 
    		}*/
    		System.out.println("이게 몇번 반복되는거지?");
    		while(amount[j]<=amount[i]) {
    			if(amount[j]==-1) {
    				break;
    			}
    			j++;
    		}
    		System.out.println(amount[i]+"//"+i+"//"+j);
    		//stack.push(i);
    		stack.push(j-i);
    		i=j;
    	}
    	
    	System.out.println(stack);
    	
    	
    	/*for (int i=0; i<amount.length;i++) {
    		System.out.println(amount[i]);
    	}*/
        int[] answer = Arrays.stream(stack.toArray(new Integer[stack.size()])).mapToInt(Integer::intValue).toArray();
        return answer;
    }
}
public class Main2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution2 s = new Solution2();
		int[] list1 = {99,99,99,99,99};
		int[] list2 = {3,3,3,3,3};
		s.solution(list1, list2);

	}

}
