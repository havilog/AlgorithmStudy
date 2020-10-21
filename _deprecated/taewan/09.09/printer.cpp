#include <iostream>
#include <string>
#include <vector>
#include <queue>
#include <deque>
using namespace std;

int solution(vector<int> priorities, int location)
{
  int answer = 0;
  priority_queue<int, vector<int>, less<int>> pq; //내림차순으로 정렬
  deque<pair<int, int>> vec;                      //우선순위, 인덱스
  int idx = 0;
  for (auto iter : priorities)
  {
    pq.push(iter);
    vec.push_back({iter, idx++});
  }

  while (1)
  {
    int front = vec.front().first;
    int second = vec.front().second;
    if (front == pq.top())
    { //pq에 남아있는 우선순위가 가장 높은 수와 대기목록 앞의 수가 같다면
      if (second == location)
      { //인덱스 비교
        vec.pop_front();
        break;
      }
      pq.pop();
      vec.pop_front();
    }
    else
    {
      vec.push_back({front, second}); //대기목록 앞의 값을 뒤에 넣기
      vec.pop_front();
    }
  }
  answer = priorities.size() - vec.size();
  return answer;
}