#include <iostream>
#include <string>
#include <vector>
using namespace std;

vector<vector<int>> reset(int n)
{
  vector<vector<int>> vec(n);
  int cnt = 0;
  for (int i = 0; i < n; i++)
    for (int j = 0; j < n; j++)
      vec[i].push_back(0);
  return vec;
}

void goDown(vector<vector<int>> &vec, int &y, int &x, int &cnt)
{
  while (1)
  {
    if (vec[y + 1][x] == 0)
      vec[++y][x] = ++cnt;
    else
      break;
  }
}

void goRight(vector<vector<int>> &vec, int &y, int &x, int &cnt)
{
  while (1)
  {
    if (vec[y][x + 1] == 0)
      vec[y][++x] = ++cnt;
    else
      break;
  }
}

void goDiagonal(vector<vector<int>> &vec, int &y, int &x, int &cnt)
{
  while (1)
  {
    if (vec[y - 1][x - 1] == 0)
      vec[--y][--x] = ++cnt;
    else
      break;
  }
}

vector<int> except(int n)
{
  vector<int> answer;
  answer.push_back(1);
  if (n == 2)
  {
    answer.push_back(2);
    answer.push_back(3);
  }
  return answer;
}

vector<int> solution(int n)
{
  vector<int> answer;
  vector<vector<int>> vec = reset(n);
  if (n == 1 || n == 2)
    return except(n);

  int cnt = 0;
  int result = n * (n + 1) / 2;
  for (int i = 0; i < n; i++)
    vec[i][0] = ++cnt;
  for (int i = 1; i < n; i++)
    vec[n - 1][i] = ++cnt;
  for (int i = n - 2; i != 0; i--)
    vec[i][i] = ++cnt;
  int y = 1, x = 1;

  while (cnt < result)
  {
    goDown(vec, y, x, cnt);
    goRight(vec, y, x, cnt);
    goDiagonal(vec, y, x, cnt);
  }

  for (int i = 0; i < n; i++)
  {
    for (int j = 0; j < n; j++)
    {
      if (vec[i][j] != 0)
        answer.push_back(vec[i][j]);
      else
        break;
    }
  }
  return answer;
}