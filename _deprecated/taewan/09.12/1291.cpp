#include <iostream>
#include <vector>
using namespace std;

class Solution
{
public:
  vector<int> answer;
  int low, high;
  void recursive(int num)
  {
    if (num > high)
      return;
    else if (num >= low && num <= high)
      answer.push_back(num);
    int last = num % 10;
    if (last == 9)
      return;
    int next = num * 10 + last + 1;
    recursive(next);
  }

  vector<int> sequentialDigits(int low, int high)
  {
    this->low = low, this->high = high;
    for (int i = 1; i < 10; i++)
      recursive(i);
    sort(answer.begin(), answer.end());
    return answer;
  }
};

int main(void) { return 0; }