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
        for(int i = 0; i < temp.size(); i++)        //각각의 단어를 알파벳 순으로 정렬   eat => aet
            sort(temp[i].begin(), temp[i].end());   
        for(int i = 0; i < temp.size(); i++) {
            if(m.find(temp[i]) == m.end()) {        //map에 키값이 없다면 strs배열 값을 추가해준다.
                vector<string> vec;
                vec.push_back(strs[i]);
                m[temp[i]] = vec;
            } else m[temp[i]].push_back(strs[i]); //이미 있는 키값이라면 push
        }
        for(auto iter : m) answer.push_back(iter.second);            
        return answer;
    }
};

int main(void){
  return 0;
}