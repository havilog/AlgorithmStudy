//기지국 설치
#include <iostream>
#include <vector>
using namespace std;

vector<pair<int, int>> reset(int n, vector<int> stations, int w) {
    vector<pair<int, int>> vec; //전파된 아파트의 범위를 구해준다.
    for(auto iter: stations) {
        int start, end;
        iter - w < 1? start = 1: start = iter - w;
        iter + w > n? end = n: end = iter + w;
        vec.push_back({start, end});
    }
    return vec;
}

vector<pair<int, int>> findApart(int n, vector<pair<int, int>> vec) {
    vector<pair<int, int>> map; //전파되지 않은 아파트의 범위를 구해준다.
    if(vec[0].first != 1) map.push_back({1, vec[0].first - 1});
    for(int i = 0; i < vec.size() - 1; i++) {
        if(vec[i + 1].first - vec[i].second < 2) continue;
        map.push_back({vec[i].second + 1, vec[i + 1].first - 1});
    }
    if(vec.back().second != n) map.push_back({vec.back().second + 1, n});
    return map;    
}

int solution(int n, vector<int> stations, int w) {
    int answer = 0;
    vector<pair<int, int>> vec = reset(n, stations, w);
    vec = findApart(n, vec);
    for(auto iter: vec) {
        int diff = iter.second - iter.first + 1;
        answer += diff / (2 * w + 1);
        if(diff % (2 * w + 1) != 0) answer++; 
    }
    return answer;
}