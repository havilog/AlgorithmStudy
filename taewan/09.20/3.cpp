#include <iostream>
#include <string>
#include <vector>
#include <stack>
using namespace std;

vector<int> solution(vector<int> prices)
{
  vector<int> answer(prices.size(), 0);
  stack<pair<int, int>> s;
  s.push({prices[0], 0});

  for (int i = 1; i < prices.size(); i++)
  {
    if (s.size() > 0 && s.top().first > prices[i])
    {
      while (1)
      {
        if (s.size() > 0 && s.top().first > prices[i])
        {
          answer[s.top().second] = i - s.top().second;
          s.pop();
        }
        else
        {
          s.push({prices[i], i});
          break;
        }
      }
    }
    else
      s.push({prices[i], i});
  }
  while (!s.empty())
  {
    answer[s.top().second] = prices.size() - 1 - s.top().second;
    s.pop();
  }
  return answer;
}