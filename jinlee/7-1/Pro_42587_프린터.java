import java.util.Collections;
import java.util.PriorityQueue;

public class Pro_42587_프린터 {
    public int solution(int[] priorities, int location) {
        int answer = 0;
        // 내림차순 정렬
        PriorityQueue<Integer> pq = new PriorityQueue<>(Collections.reverseOrder());

        // 큐로 변형
        for(int priority : priorities){
            pq.add(priority);
        }
        
        // pq가 모두 poll될동안
        while(!pq.isEmpty()){
        	// 원래 배열 priorities를 순회하면서
            for(int i = 0; i < priorities.length; i++){
            	// pq의 최대값이자 가장 첫 원소가 priorities의 원소와 같을 때
                if(pq.peek() == priorities[i]){
                	// 최대값이므로 프린트를 해준다. 즉, pq에서 제거한다.
                    pq.poll();
                    // 몇개나 프린트됬는지 알아야하기 때문에 증가시켜준다.
                    answer++;
                    // 근데 우리가 알고자하는 원소의 인덱스인 location이 i와 같으면 
                    if (location == i){
                    	// 더이상 반복하며 메모리 소비할 필요 없으므로 clear와 break 해준다.
                        pq.clear();
                        break;
                    }
                }
            }
        }
        return answer;
    }
    
}