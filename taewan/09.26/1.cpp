//단어 변환
#include <iostream>
#include <string>
#include <vector>
using namespace std;
int answer = 51;
string result;
bool visit[51] = {
    false,
};
vector<string> vec;
bool isValid(string target, vector<string> words)
{ //words안에 target값이 없다면 0을 반환해야 한다.
  for (auto iter : words)
    if (iter == target)
      return false;
  return true;
}

bool isSame(string s1, string s2)
{ // 한 글자만 다른지 확인
  int diff = 0;
  for (int i = 0; i < s1.length(); i++)
    if (s1[i] != s2[i])
      diff++;
  ;
  if (diff > 1)
    return false;
  return true;
}

void dfs(string str, int depth)
{
  if (str == result && answer > depth)
  {
    answer = depth;
    return;
  }

  for (int i = 0; i < vec.size(); i++)
  {
    if (!visit[i] && isSame(str, vec[i]))
    {
      visit[i] = true;
      dfs(vec[i], depth + 1);
      visit[i] = false;
    }
  }
}

int solution(string begin, string target, vector<string> words)
{
  if (isValid(target, words))
    return 0;
  result = target;
  vec = words;
  dfs(begin, 0);
  return answer;
}