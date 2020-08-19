class Solution {
public:
    bool isValid(string str) {
        bool answer = true;
        stack<char> s;
        int i = 0;
        for(i = 0; i < str.length(); i++) {
            if(s.size() == 0 && (str[i] == ')' || str[i] == ']' || str[i] == '}')) break;
            if(str[i] == ')') {
                if(s.top() == '(') s.pop();
                else break;
            } else if(str[i] == ']') {
                if(s.top() == '[')  s.pop();
                else break;
            } else if(str[i] == '}') {
                if(s.top() == '{') s.pop();
                else break;
            } else s.push(str[i]);
        }      
        if(s.size() != 0 || i != str.length()) answer = false;
        return answer;   
    }
};