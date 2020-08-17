#include<iostream>
#include<vector>
#include<set>
#include<algorithm>
using namespace std;

class Solution {
public:
    int target = 0;
    set<vector<int>> s;
    void recursive(vector<int>& candidates, int total, vector<int> temp) {
        if(total == target) {
            sort(temp.begin(), temp.end());
            s.insert(temp);
            return ;
        }
        for(auto iter : candidates) {
             if(total + iter <= target) {
                temp.push_back(iter);
                recursive(candidates, total + iter, temp);
                temp.pop_back();
            }
        }        
    }
    
    vector<vector<int>> combinationSum(vector<int>& candidates, int target) {
        this->target = target;
        vector<int> temp;
        vector<vector<int>> answer;
        recursive(candidates, 0, temp);
        for(auto iter : s) answer.push_back(iter);
        return answer;
    }
};

int main(void){
  return 0;
}