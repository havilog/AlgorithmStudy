// 929. Unique Email Addresses
#include<iostream>
#include<string>
#include<set>
#include<vector>
using namespace std;

class Solution {
public:
    string uniqueEmail(string str){
        string answer = "";
        bool afterDot = false, plus = false;;
        for(int i = 0; i < str.length(); i++){
            if(str[i] == '+'){
                while(1) {      //+를 만나면 @를 만날 때까지 넘어간다.
                    if(str[i] == '@'){
                        answer += '@';
                        afterDot = true;
                        break;
                    }
                    i++;
                }
            } else if(str[i] == '@'){   //+를 안만나고 @를 만났을 때
                afterDot = true;
                answer += '@';
            } else if(str[i] == '.') {
                if(afterDot) answer += str[i];  //@이후 .은 저장하고 이전 .은 저장하지 않는다.
            } else answer += str[i];
        }
        return answer;
    }

    int numUniqueEmails(vector<string>& emails) {
        set<string> s;
        for(int i = 0; i < emails.size(); i++)
            s.insert(uniqueEmail(emails[i]));
        return s.size();
    }
};

int main(void){
  return 0;
} 
