#include<iostream>
#include<vector>
#include<string>
using namespace std;

class Solution {
public:
    int firstUniqChar(string s) {
        vector<int> vec(26, 0);
        for(auto iter: s) vec[iter - 'a']++;
        for(int i = 0; i < s.length(); i++) 
            if(vec[s[i] - 'a'] == 1) return i;
        return -1;
    }
};