//영어 끝말잇기
#include <string>
#include <vector>
#include <iostream>
#include <unordered_map>
using namespace std;

vector<int> solution(int n, vector<string> words)
{
  vector<int> answer;
  int order = 0;
  int cnt = 0;
  unordered_map<string, bool> un;
  un[words[0]] = true;
  for (int i = 1; i < words.size(); i++)
  {
    if (un.find(words[i]) == un.end() &&
        words[i - 1][words[i - 1].length() - 1] == words[i][0])
      un[words[i]] = true;
    else
    {
      cnt = (i / n) + 1;
      order = i % n + 1;
      break;
    }
  }
  if (cnt == 0)
    answer.push_back(0);
  else
    answer.push_back(order);
  answer.push_back(cnt);
  return answer;
}