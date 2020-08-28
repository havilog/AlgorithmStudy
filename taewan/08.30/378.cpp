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


//O(klogN)
struct Matrix {int y, x, val;};
struct Compare {
    bool operator()(Matrix a, Matrix b) {   //val을 기준으로 오름차순 정렬
        return a.val > b.val;
    }
};

class Solution {
public:
    int kthSmallest(vector<vector<int>>& arr, int k) {
        priority_queue<Matrix, vector<Matrix>, Compare> pq;
        for(int i = 0; i < arr.size(); i++) pq.push({i, 0, arr[i][0]});
        int cnt = 0;
        while(++cnt < k) {
            int y = pq.top().y;
            int x = pq.top().x;
            int val = pq.top().val;
            pq.pop();
            if(x + 1 < arr.size()) pq.push({y, x + 1, arr[y][x + 1]});
        }
        return pq.top().val;
    }
};