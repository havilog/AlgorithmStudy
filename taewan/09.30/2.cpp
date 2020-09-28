//야근 지수
#include <iostream>
#include <string>
#include <vector>
#include <math.h>
#include <queue>
#define ll long long
using namespace std;

ll solution(int n, vector<int> works) {
    ll answer = 0;
    priority_queue<int, vector<int>, less<int>> pq;
    for(auto iter: works) pq.push(iter);
    while(n) {
        int front = pq.top();
        pq.pop();
        pq.push(--front);
        n--;
    }
    
    while(!pq.empty()) {
        int top = pq.top();
        if(top > 0)
            answer += pow(top, 2);
        pq.pop();
    }
    return answer;
}