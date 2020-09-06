#include <iostream>
#include <vector>
using namespace std;
class Solution
{
public:
  int answer = 0, S;
  vector<int> nums;
  void dfs(int depth, int total) {
    if (nums.size() == depth) {
      if (total == S) answer++;
      return;
    }
    else {
      dfs(depth + 1, total + nums[depth]);
      dfs(depth + 1, total - nums[depth]);
    }
  }

  int findTargetSumWays(vector<int> &nums, int S){
    this->nums = nums;
    this->S = S;
    dfs(0, 0);
    return answer;
  }
};

int main(void) {
  return 0;
}
