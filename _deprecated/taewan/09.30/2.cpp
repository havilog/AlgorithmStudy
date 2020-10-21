//야근 지수
/*
    야근 지수가 가장 작으려면?
    => 배열에 있는 값들을 모두 최소로 만들어줘야 한다.
    priority_queue를 내림차순으로 만든다.
    queue의 top에 있는 것들을 1씩 빼주는 방식으로 n번 진행
*/
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