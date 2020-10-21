#include<iostream>
#include<vector>
using namespace std;

class Solution {
public:
    bool canJump(vector<int>& nums) {
        bool answer = false;
        int loc = 0;
        if(nums.size() == 1) return true;   //크기가 1일 때는 무조건 true
        vector<int> visit(nums.size(), 0);
        visit[0] = nums[0];

        for(int i = 0; i < nums.size(); i++) {
            if(i != 0) visit[i] = max(--visit[i - 1], nums[i]); //이전 결과 - 1과 nums[i]값을 비교한다.
                                                                //visit[i]가 0이면 갈 수 없다는 것
            if(i != nums.size() - 1 && visit[i] == 0) return false;
        }
        return true;
    }
};

int main(void){return 0;}