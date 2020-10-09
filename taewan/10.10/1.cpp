//섬 연결하기
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;
int node[101];
int depth[101];
bool compare(vector<int> a, vector<int> b) {return a[2] < b[2];}

int find(int root) {
    if(node[root] == root) return root;
    else return node[root] = find(node[root]);
}

void unionFunc(int a, int b) {
    int x = find(a);
    int y = find(b);
    if(x == y) return ;
    if(depth[x] > depth[y]) {
        node[y] = x;
        depth[x] += depth[y];
    } else {
        node[x] = y;
        depth[y] += depth[x];
    }
}

int solution(int n, vector<vector<int>> costs) {
    int answer = 0;
    sort(costs.begin(), costs.end(), compare);  //간선의 크기를 기준으로 정렬
    fill(depth, depth + n, 1);
    for(int i = 0; i < n; i++) node[i] = i;
    for(int i = 0; i < costs.size(); i++) {
        if(find(node[costs[i][0]]) != find(node[costs[i][1]])) {  //사이클이 만들어지지 않았다면
            answer += costs[i][2];
            unionFunc(costs[i][0], costs[i][1]);
        }
    }
    return answer;
}