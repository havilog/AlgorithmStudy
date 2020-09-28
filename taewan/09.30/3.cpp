//배달
#include <iostream>
#include <vector>
#include <queue>
#define MAX 123456789
using namespace std;
vector<vector<pair<int, int>>> vec(51);
int dist[51];
void reset(int N, vector<vector<int>> road) {
    for(auto iter: road) {
        vec[iter[0]].push_back({iter[2], iter[1]});
        vec[iter[1]].push_back({iter[2], iter[0]});
    }
    fill(dist + 1, dist + N + 1, MAX);
}

void dijkstra(int N, vector<vector<int>> road) {
    priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> pq;
    dist[1] = 0;
    pq.push({0, 1});
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

int solution(int N, vector<vector<int>> road, int K) {
    int answer = 0;
    reset(N, road);
    dijkstra(N, road);
    for(int i = 1; i <= N; i++) 
        if(dist[i] <= K) answer++;
    return answer;
}