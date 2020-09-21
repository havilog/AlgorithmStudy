//N진수 게임
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

string numberChange(int num, int jinsu)
{
  string result = "";
  while (num > 0)
  {
    int n = num % jinsu;
    if (n == 10)
      result += "A";
    else if (n == 11)
      result += "B";
    else if (n == 12)
      result += "C";
    else if (n == 13)
      result += "D";
    else if (n == 14)
      result += "E";
    else if (n == 15)
      result += "F";
    else
      result += to_string(n);
    num /= jinsu;
  }
  reverse(result.begin(), result.end());
  return result;
}

string makeString(int n, int t, int m, int p)
{
  string result = "0";
  int num = 0;
  while (result.length() < t * m)
  {
    result += numberChange(num++, n);
  }
  return result;
}

string chooseString(string str, int t, int m, int p)
{
  string result = "";
  int cnt = 0;
  while (result.length() != t)
  {
    result += str[p + (m * cnt) - 1];
    cnt++;
  }
  return result;
}

string solution(int n, int t, int m, int p)
{
  string answer = "";
  string str = makeString(n, t, m, p);
  answer = chooseString(str, t, m, p);
  return answer;
}