#include <iostream>
#include <string>
using namespace std;

class Solution
{
public:
  string minWindow(string s, string t)
  {
    int slen = s.size(), tlen = t.size(), i, start = 0, count, minL = INT_MAX, minS;
    int dict[128];
    fill_n(dict, 128, -slen);
    for (i = 0; i < tlen; ++i)
      dict[t[i]] = dict[t[i]] > 0 ? (dict[t[i]] + 1) : 1;

    for (i = 0, count = tlen; i < slen; ++i)
    {
      if ((--dict[s[i]] >= 0) && (--count == 0))
      {
        while (dict[s[start]] <= -slen || (++dict[s[start]] <= 0))
          ++start;
        if (minL > i - start + 1)
        {
          minL = i - start + 1;
          minS = start;
        }
        count = 1;
        ++start;
      }
    }
    return minL == INT_MAX ? "" : s.substr(minS, minL);
  }
};

int main(void) { return 0; }