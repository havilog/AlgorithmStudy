//숫자 블록
#include <iostream>
#include <string>
#include <vector>
#include <math.h>
#define ll long long
#define MAX 10000000
using namespace std;

int isPrime(int n)
{
  for (int i = 2; i <= sqrt(n); i++)
    if (n % i == 0)
    {
      int result = n / i;
      if (result > MAX) //10,000,000블록까지 밖에 없으므로 몫이 MAX보다 커지면 안된다.
        continue;
      return result;
    }
  return 0;
}

vector<int> solution(long long begin, long long end)
{
  long long size = end - begin + 1;
  vector<int> answer(size);
  int idx = 0;
  for (int i = begin; i <= end; i++, idx++)
  {
    int n = isPrime(i);
    if (n == 0)
      answer[idx] = 1;
    else
      answer[idx] = n;
  }
  if (begin == 1)
    answer[0] = 0;
  return answer;
}