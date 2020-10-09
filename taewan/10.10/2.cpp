//입국심사
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#define ll long long 
using namespace std;

ll calculatePerson(vector<int> person, ll time) {
    ll result = 0;
    for(auto iter: person) result += time / iter;
    return result;
}

ll solution(int n, vector<int> times) {
    ll answer = 0;
    ll start = 1, end = 1000000000000000000;
    while(start <= end) {
        ll mid = (start + end) / 2;
        ll cal = calculatePerson(times, mid);
        if(cal < n) start = mid + 1;
        else end = mid - 1;
    }
    answer = start;
    return answer;
}