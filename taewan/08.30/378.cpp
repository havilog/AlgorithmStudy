#include<iostream>
#include<vector>
#include<queue>
using namespace std;

//using priority_queue
//124ms    15.4MB
class Solution {
public:
    int kthSmallest(vector<vector<int>>& matrix, int k) {
        priority_queue<int, vector<int>, greater<int>> pq;
        int cnt = 0;
        for(auto iter: matrix)
            for(auto iter2: iter) pq.push(iter2);
        
        while(++cnt < k) pq.pop();
        return pq.top();
    }
};


//using vector
//100ms    15.3MB
class Solution {
public:
    int kthSmallest(vector<vector<int>>& matrix, int k) {
        int cnt = 0;
        vector<int> vec;
        for(auto iter: matrix) 
            for(auto iter2: iter) vec.push_back(iter2);
        sort(vec.begin(), vec.end());
        return vec[k - 1];
    }
};