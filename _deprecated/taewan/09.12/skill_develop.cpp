#include <iostream>
#include <string>
#include <vector>

using namespace std;

vector<int> calculateDay(vector<int> progresses, vector<int> speeds)
{
  vector<int> vec;
  for (int i = 0; i < progresses.size(); i++)
  {
    int diff = 100 - progresses[i];
    int temp = diff / speeds[i];
    if (diff % speeds[i])
      temp++;
    vec.push_back(temp);
  }
  return vec;
}

vector<int> solution(vector<int> progresses, vector<int> speeds)
{
  vector<int> answer;
  vector<int> vec = calculateDay(progresses, speeds);
  int idx = 0;
  for (int i = 0; i < vec.size(); i++)
  {
    if (vec[idx] < vec[i])
    {
      answer.push_back(i - idx);
      idx = i;
    }
  }
  answer.push_back(vec.size() - idx);
  return answer;
}