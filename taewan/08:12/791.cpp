// 791. Custom Sort String

#include<iostream>
#include<string>
using namespace std;
class Solution {
public:
    string customSortString(string S, string T) {
        string answer = "";
        int cntAlpha[26] = { 0, };      
        for(int i = 0; i < T.length(); i++)     //T문자열에서 각 알파뱃의 개수를 cntAlpha배열에 저장
            cntAlpha[T[i] - 'a']++;
        
        for(int i = 0; i < S.length(); i++){        //S에 있는 문자를 cntAlpha에 저장된 수 만큼 더해준다.
            for(int j = 0; j < cntAlpha[S[i] - 'a']; j++)
                answer += S[i];                
            cntAlpha[S[i] - 'a'] = 0;
        }
        
        for(int i = 0; i < 26; i++){        //남은 문자열을 더해준다.
            char c = i + 'a';
            for(int j = 0; j < cntAlpha[i]; j++)
                answer += c;
        }
        return answer;
    }
};

int main(void){
  return 0;
}