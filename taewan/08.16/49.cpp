#include<iostream>
#include<vector>
#include<string>
#include<map>
using namespace std;

class Solution {
public:
    vector<vector<string>> groupAnagrams(vector<string>& strs) {
        vector<vector<string>> answer;
        vector<string> temp = strs;
        map<string, vector<string>> m;
        for(int i = 0; i < temp.size(); i++)
            sort(temp[i].begin(), temp[i].end());
        for(int i = 0; i < temp.size(); i++) {
            if(m.find(temp[i]) == m.end()) {
                vector<string> vec;
                vec.push_back(strs[i]);
                m[temp[i]] = vec;
            } else 
                m[temp[i]].push_back(strs[i]);
        }
        for(auto iter : m)
            answer.push_back(iter.second);            
        return answer;
    }
};

int main(void){
  return 0;
}