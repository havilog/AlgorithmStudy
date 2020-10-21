//카펫
#include <iostream>
#include <string>
#include <vector>
using namespace std;

vector<int> findCarpet(int total) {
  vector<int> vec;
  for (int i = 1; i <= total / 2; i++)
    if (total % i == 0) vec.push_back(i);
  vec.push_back(total);
  return vec;
}

bool check(int y, int x, int brown, int yellow) {
  if (y * 2 + (x - 2) * 2 == brown && (y - 2) * (x - 2) == yellow) return true;
  return false;
}

vector<int> solution(int brown, int yellow) {
  vector<int> answer;
  vector<int> vec = findCarpet(brown + yellow);
  for (int i = 0; i <= vec.size() / 2; i++) {
    int x = vec[i];
    int y = vec[vec.size() - i - 1];
    if (x <= y && check(y, x, brown, yellow)) {
      answer.push_back(y);
      answer.push_back(x);
      break;
    }
  }
  return answer;
}