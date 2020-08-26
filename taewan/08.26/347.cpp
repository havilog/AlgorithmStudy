bool compare(pair<int, int> a, pair<int, int> b) {
    return a.second > b.second;
}
class Solution {
public:
    vector<int> topKFrequent(vector<int>& nums, int k) {
        map<int, int> m;
        vector<int> answer;
        for(auto iter: nums) {
            if(m.find(iter) == m.end()) m[iter] = 1;
            else m[iter]++;
        }
        vector<pair<int, int>> vec;
        for(auto iter: m) vec.push_back({iter.first, iter.second});
        sort(vec.begin(), vec.end(), compare);
        for(int i = 0; i < k; i++)
            answer.push_back(vec[i].first);
        return answer;
    }
};
