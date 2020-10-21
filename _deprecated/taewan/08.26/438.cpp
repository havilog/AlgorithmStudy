#include<iostream>
#include<vector>
#include<string>
using namespace std;
class Solution {
public:
	vector<int> findAnagrams(string s, string p) {
        vector<int> answer;
        vector<int> vec(26, 0), temp(26, 0);
        int front = p.length(), back = 0;

        if(s.length() < p.length()) return answer;
        for(int i = 0; i < p.length(); i++){
            vec[p[i] - 'a']++;
            temp[s[i] - 'a']++;
        }
        
        for( ; front < s.length(); front++, back++) {
            if(temp == vec) answer.push_back(back);
            temp[s[back] - 'a']--;
            temp[s[front] - 'a']++;
        }
        if(temp == vec) answer.push_back(back);
        return answer;
    }
};

int main(){return 0;}