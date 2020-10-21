// 가장 먼 노드
#include <iostream>
#include <string>
#include <vector>
#include <queue>
#include <algorithm>
#define MAX 123456789
using namespace std;
vector<vector<pair<int, int>>> vec(20001);
int dist[20001];
void reset(int n, vector<vector<int>> edge) {
    fill(dist + 1, dist + n + 1, MAX);
    for(auto iter: edge) {
        vec[iter[0]].push_back({1, iter[1]});
        vec[iter[1]].push_back({1, iter[0]});
    }
}

void dijkstra(int n, vector<vector<int>> edge) {  //다익스트라
    priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> pq;
    pq.push({0, 1});
    dist[1] = 0;
    while(!pq.empty()) {
        int cost = pq.top().first;
        int vertex = pq.top().second;
        pq.pop();
        for(int i = 0; i < vec[vertex].size(); i++) {
            int nextCost = vec[vertex][i].first;
            int nextVertex = vec[vertex][i].second;
            if(dist[nextVertex] > dist[vertex] + nextCost) {
                dist[nextVertex] = dist[vertex] + nextCost;
                pq.push({dist[nextVertex], nextVertex});
            }
        }
    }
}

int solution(int n, vector<vector<int>> edge) {
    int answer = 0;
    reset(n, edge);    
    dijkstra(n, edge);
    sort(dist + 1, dist + n + 1);
    for(int i = n; i > 0; i--) {
        if(dist[n] == dist[i]) answer++;
        else break;
    }
    return answer;
}