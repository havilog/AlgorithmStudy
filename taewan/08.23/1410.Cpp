#include<iostream>
#include<string>
#include<stack>
using namespace std;

class Solution {
public:
    string adding = "";
    bool checkString(string str){
        if(str == "&quot") adding = "\"";
        else if(str == "&apos") adding = "\'";                
        else if(str == "&amp") adding = "&";                
        else if(str == "&gt") adding = ">";                
        else if(str == "&lt") adding = "<";                
        else if(str == "&frasl") adding = "/";                
        else {
            adding = str;
            return false;
        } return true;
    }
    
    bool checking(stack<char> &s) {
        string temp = "";
        while(!s.empty()) {
            temp += s.top();
            s.pop();
        }
        reverse(temp.begin(), temp.end());
        if(checkString(temp)) return true;
        return false;
    }
    
    string entityParser(string text) {
        string answer = "";
        bool start = false;     //stack에 문자열 넣기 시작
        stack<char> s;
        for(auto iter : text) {
            if(iter == '&') {
                s.push('&');
                start = true;   //문자열 넣기 시작
            } else if(start && iter == ';') {   //문자열 넣기 끝
                if(!checking(s)) adding += ';';   //바뀌는 문자열이 아니라면 adding뒤에 ;만 추가해주면 된다. 
                start = false;
                answer += adding;
                adding = "";
            } else if(start) s.push(iter);      //&다음에 나오는 문자들을 stack에 저장
            else answer += iter;
        }
        return answer;
    }
};

int main(void){
  return 0;
}