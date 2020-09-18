#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <stack>
using namespace std;
vector<char> oper;
vector<long long> vec;
long long answer = 0;
vector<pair<vector<long long>, vector<char>>> calculate(vector<long long> v, vector<char> op, char operation)
{ //원하는 연산자로 계산
  int last;
  vector<pair<vector<long long>, vector<char>>> result;
  vector<long long> vec2;
  vec2.push_back(v[0]);
  vector<char> c;
  for (int i = 0; i < op.size(); i++)
  {
    last = vec2.size() - 1;
    if (operation == '+' && op[i] == operation)
      vec2[last] = vec2[last] + v[i + 1];
    else if (operation == '-' && op[i] == operation)
      vec2[last] = vec2[last] - v[i + 1];
    else if (operation == '*' && op[i] == operation)
      vec2[last] = vec2[last] * v[i + 1];
    else
    {
      vec2.push_back(v[i + 1]);
      c.push_back(op[i]);
    }
  }
  result.push_back({vec2, c});
  return result;
}

void calculateOrder(char a, char b, char c)
{ //a, b, c우선 순위대로 계산
  vector<char> op = oper;
  vector<long long> v = vec;
  vector<pair<vector<long long>, vector<char>>> pairVec;
  char arr[3] = {a, b, c};
  for (int i = 0; i < 3; i++)
  {
    pairVec = calculate(v, op, arr[i]);
    v = pairVec[0].first;
    op = pairVec[0].second;
  }
  long long result = v[0];
  if (result < 0)
    result *= -1;
  if (answer < result)
    answer = result;
}

void splitExpression(string expression)
{
  string temp = "";
  for (int i = 0; i < expression.length(); i++)
  {
    if (expression[i] == '*' || expression[i] == '+' || expression[i] == '-')
    {
      vec.push_back(stoll(temp));
      oper.push_back(expression[i]);
      temp = "";
    }
    else
      temp += expression[i];
  }
  vec.push_back(stoll(temp));
}

long long solution(string expression)
{
  splitExpression(expression); //숫자와 연산자를 나누기
  calculateOrder('+', '-', '*');
  calculateOrder('+', '*', '-');
  calculateOrder('-', '+', '*');
  calculateOrder('-', '*', '+');
  calculateOrder('*', '-', '+');
  calculateOrder('*', '+', '-');
  return answer;
}