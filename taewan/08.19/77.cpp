#include<iostream>
#include<vector>
using namespace std;
class Solution {
public:
    vector<vector<int>> answer;
    bool visit[21] = { false, };
    int N, k;
    void recursive(int idx, int cnt) {  //N개 중 k개 뽑기
        if(cnt == k) {
            vector<int> temp;
            for(int i = 1; i <= N; i++) 
                if(visit[i]) temp.push_back(i);
            answer.push_back(temp);
            return ;
        }
        
        for(int i = idx; i <= N; i++) {
            if(visit[i]) continue;
            visit[i] = true;
            recursive(i, cnt + 1);
            visit[i] = false;
        }
    }
    
    vector<vector<int>> combine(int n, int k) {
        N = n; this->k = k;
        recursive(1, 0);
        return answer;
    }
};
int main(void){
  return 0;
}