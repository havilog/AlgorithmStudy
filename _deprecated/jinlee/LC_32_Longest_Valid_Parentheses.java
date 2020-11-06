class Solution {
    public int longestValidParentheses(String s) {
        Stack<Integer> stack = new Stack<Integer>(); 
        int max = 0;
        
        for(int i =0 ; i<s.length(); i++){
            if(s.charAt(i)=='('){ // "("을 만나면 stack에 push
                stack.push(i);
            }else{ //")"이면
                if(!stack.isEmpty() && s.charAt(stack.peek())=='('){ //stack에 element가 있고 top의 값이 "("일때
                    stack.pop(); //pop
                    int last = -1; //*********??????***********
                    if(!stack.empty()){ 
                        last = stack.peek();
                    }
                    int len = i - last;
                    max = (max < len) ? len : max;
                }else{ //stack에 아무것도 없을때
                    stack.push(i); //")" push 
                }
            }
        }
        return max;
    }
}

/*
Input string을 순회하면서 "("을 만나면 stack에 해당 index를 넣어준다.
")"인 경우 stack의 element 하나를 제거한다. 그 다음:
  stack에 element가 없는 경우: 현재 index를 stack에 넣어준다.
  stack에 element가 있는 경우: 현재 index와 stack의 top element의 차이가 현재 valid substring의 길이가 되므로 maxLength와 비교하여 값을 설정해준다.
순회가 종료된 후 maxLength를 반환한다.
*/