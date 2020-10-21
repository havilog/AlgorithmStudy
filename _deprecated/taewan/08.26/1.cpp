#include<iostream>
#include<vector>
#include<unordered_map>
using namespace std;

/* case 1 */
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        for(int i = 0; i < nums.size(); i++) {
            int diff = target - nums[i];
            for(int j = i + 1; j < nums.size(); j++) {
                if(nums[i] + nums[j] == target) return {i, j};
            }
        }
        return {};
    }
};

/* case2 */
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        
        unordered_map<int,int> map;
        vector<int> result;
        
        for(int i = 0 ; i < nums.size(); i++)
        {
            map.insert(make_pair(nums[i], i));
        }

        for(int i = 0 ; i < nums.size(); i++)
        {
            if(map.find(target-nums[i]) != map.end() && i != map[target-nums[i]])
            {
                result.push_back(i);
                result.push_back(map[target-nums[i]]);
                break;
            }
        }
        
        return result;
    }
};
int main(void){
  return 0;
}