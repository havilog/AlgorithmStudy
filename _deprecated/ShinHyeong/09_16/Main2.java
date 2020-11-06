import java.util.ArrayList;
import java.util.Collections;
import java.util.TreeMap;

class Solution {
	// 이걸 TreeSet으로 해야할 지
	//TreeMap<Integer, Integer> NoneA = new TreeMap<>();
	ArrayList<ArrayList<TreeMap<Integer,Integer>>> NoneB = new ArrayList<>();
	String str;
	int sum=0;
    public int solution(String name) {
    	str = name;
    	ArrayList<TreeMap<Integer,Integer>> a = new ArrayList<>();
    	for (int i=0; i<name.length();i++) {
    		if (name.charAt(i)!='A') {
    			TreeMap<Integer, Integer> tree = new TreeMap<>();
    			tree.put(i, 0);
    			a.add(tree);
    		}
    	}
    	NoneB.add(a);
    	System.out.println(NoneB);
    	this.horizonMove(0, -1, 0, 0, sum); // index = 0으로 향하게 가는 것
    	//this.horizonMove(0, -1, 1, 0); // 왼쪽으로 가는 것
        int answer = 0;
        return answer;
    }
    public void horizontal(String name) {
    	
    }
    // Case 1개만 가지고 하자
    public int horizonMove(int curindex , int index, int direct, int length, int sum ) { // curindex : 현 위치 index : A가 아닌 것들에 대한 움직임
    	int len =0;
    	NoneB.add(NoneB.get(sum));
    	System.out.println("현위치 "+curindex+"길이는 "+length+"인덱스는  "+index+"총 몇개를 선택받았는지"+sum);
    	if (sum==NoneB.get(sum+1).size()) {
    		System.out.println("최종 Length"+length+"///"+curindex);
    		return length; // index가 다 채워지면이 아니여야 함
    	}
    	if (direct==0) { // 0 : 오른쪽으로 감
    		int amount=0;
    		while(true) {
    			index+=1;
    			if (index>=NoneB.get(sum+1).size()) {
    				index-=NoneB.get(sum+1).size();
    				amount = (str.length()-curindex);
    				curindex=0;
    				len = amount+NoneB.get(sum+1).get(index).firstKey();
    			}
    			else {
    				System.out.println("나 여기 있네");
    				len = amount + ( NoneB.get(sum+1).get(index).firstKey() - curindex ); // 너무 어렵다 : 경우의 수가 많
    			}
    			if (NoneB.get(sum+1).get(index).get(NoneB.get(sum+1).get(index).firstKey())==0) { // 찾으면
    				break;
    			}
    		}
    		length+= len;
    		curindex = NoneB.get(sum+1).get(index).firstKey();
    		System.out.println(NoneB+"%%");
    		NoneB.get(sum+1).get(index).replace(NoneB.get(sum+1).get(index).firstKey(), NoneB.get(sum+1).get(index).getOrDefault(NoneB.get(sum+1).get(index).firstKey(), 0)+1);
    		System.out.println(NoneB+"%%");
    		
    		System.out.println(NoneB);
    		System.out.println(NoneB.get(sum+1)+" || "+curindex+" || "+index+"||"+sum);
    		this.horizonMove(curindex, index, 0, length, sum+1);
    		//System.out.println(arr+" || "+curindex+" || "+index);
    		System.out.println(NoneB);
    		System.out.println("아니 어떻게 이렇게 나오지"+NoneB.get(sum+1)+" || "+curindex+" || "+index+" || "+sum);
    		this.horizonMove(curindex, index, 1, length, sum+1);
    		
    	}
    	
    	if (direct==1) { // 1 : 왼쪽으로 감
    		while(true) { /// whiletrue를 계속 도는 것같음
    			index-=1;
    			if (index<0) {
    				index = NoneB.get(sum+1).size()+index;
    				len = length+(str.length()-NoneB.get(sum+1).get(index).firstKey()); /////////// 이것도 다시해야함
    			}
    			else {
    				len = curindex - NoneB.get(sum+1).get(index).firstKey();
    			}
    			if (NoneB.get(sum+1).get(index).get(NoneB.get(sum+1).get(index).firstKey())==0) { // 찾으면
    				break;
    			}
    		}
    		length+= len; // NoneA로 갔는지 안갔는지가 궁금함
    		curindex = NoneB.get(sum+1).get(index).firstKey();
    		NoneB.get(sum+1).get(index).replace(NoneB.get(sum+1).get(index).firstKey(), NoneB.get(sum+1).get(index).getOrDefault(NoneB.get(sum+1).get(index).firstKey(), 0)+1);
    		sum++;
    		ArrayList<TreeMap<Integer,Integer>> arr = new ArrayList<>(NoneB.get(sum+1));
    		//System.out.println("현위치 "+curindex+"길이는 "+length+"인덱스는  "+index+"총 몇개를 선택받았는지"+sum);
    		this.horizonMove(curindex, index, 0, length, sum);
    	}
    	return 0;
    	
    }
}
public class Main2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution s = new Solution();
		String str1 = "ABABAAAAAAABA";
		String str2 = "JAARA";
		s.solution(str1);
		
	}

}
