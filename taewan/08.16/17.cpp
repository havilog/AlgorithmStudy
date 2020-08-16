#include<iostream>
#include<string>
#include<vector>
using namespace std;

class Solution {
public:
    vector<string> answer;    
    
    void recursive(string str, string digits, int depth) {
        if(depth == digits.length()) {      //문자열의 끝에 도달하면 answer에 push해주기
            if(str != "") answer.push_back(str);
            return ;
        }
        switch(digits[depth]) {     //한 단어씩 더하면서 재귀를 돌린다.
            case '2':
                recursive(str + 'a', digits, depth + 1);
                recursive(str + 'b', digits, depth + 1);
                recursive(str + 'c', digits, depth + 1);                
                break;
            case '3':
                recursive(str + 'd', digits, depth + 1);
                recursive(str + 'e', digits, depth + 1);
                recursive(str + 'f', digits, depth + 1);
                break;
            case '4':
                recursive(str + 'g', digits, depth + 1);
                recursive(str + 'h', digits, depth + 1);
                recursive(str + 'i', digits, depth + 1);
                break;
            case '5':
                recursive(str + 'j', digits, depth + 1);
                recursive(str + 'k', digits, depth + 1);
                recursive(str + 'l', digits, depth + 1);                
                break;
            case '6':
                recursive(str + 'm', digits, depth + 1);
                recursive(str + 'n', digits, depth + 1);
                recursive(str + 'o', digits, depth + 1);                
                break;
            case '7':
                recursive(str + 'p', digits, depth + 1);
                recursive(str + 'q', digits, depth + 1);
                recursive(str + 'r', digits, depth + 1);
                recursive(str + 's', digits, depth + 1);
                break;
            case '8':
                recursive(str + 't', digits, depth + 1);
                recursive(str + 'u', digits, depth + 1);
                recursive(str + 'v', digits, depth + 1);
                break;
            case '9':
                recursive(str + 'w', digits, depth + 1);
                recursive(str + 'x', digits, depth + 1);
                recursive(str + 'y', digits, depth + 1);
                recursive(str + 'z', digits, depth + 1);
                break;
        }
        return ;
    }
    
    vector<string> letterCombinations(string digits) {
        recursive("", digits, 0);
        return answer;
    }
};

int main(void){
  return 0;
}