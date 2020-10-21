#include <iostream>
#include <string>
#include <vector>
using namespace std;

class Solution
{
public:
  string shiftingLetters(string S, vector<int> &shifts)
  {
    string answer = "";
    int total = 0;
    for (int i = S.length() - 1; i >= 0; i--)
    {
      total += shifts[i];
      total %= 26;
      answer += (total + S[i] - 'a') % 26 + 'a';
    }
    reverse(answer.begin(), answer.end());
    return answer;
  }
};

int main(void) { return 0; }