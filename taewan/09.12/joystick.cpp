#include <iostream>
#include <string>
#include <vector>
using namespace std;
int moveVertical(string name)
{
  int cnt = 0;
  for (auto iter : name)
  {
    if (iter <= 'N')
      cnt += iter - 'A';
    else
      cnt += 'Z' - iter + 1;
  }
  return cnt;
}

int leftDistance(string name, int idx)
{
  int cnt = 0;
  while (1)
  {
    if (name[idx--] != 'A')
      break;
    cnt++;
  }
  return cnt;
}

int rightDistance(string name, int idx)
{
  int cnt = 0;
  while (1)
  {
    if (name[idx++] != 'A')
      break;
    cnt++;
  }
  return cnt;
}

int moveHorizontal(string name)
{
  int cnt = 0;
  name[0] = 'A';
  for (auto iter : name) //바꿔야 하는 문자의 수를 구해준다.
    if (iter != 'A')
      cnt++;
  int len = name.length(); //가운데 문자 시작점
  string temp = name;
  temp += name;
  temp += name;  //JEROENJEROENJEROEN(예시 1)
  int idx = len; //idx는 가운데 문자열의 위치에서 이동해야 한다.
  int total = 0; //총 이동 수
  while (1)
  {
    if (!cnt)
      break;
    int leftIdx = leftDistance(temp, idx);   //왼쪽으로 얼만큼 가야 A가 아닌 문자가 나오는가
    int rightIdx = rightDistance(temp, idx); //오른쪽으로 얼만큼 가야 A가 아닌 문자가 나오는가
    if (leftIdx < rightIdx)
    { //왼쪽으로 움직이는게 더 가깝다면
      idx -= leftIdx;
      total += leftIdx;
      if (idx < len)
        idx += len; //idx를 가운데 문자열에 맞춰주기 위해
    }
    else
    { //오른쪽으로 움직이는게 더 가깝다면
      idx += rightIdx;
      total += rightIdx;
      if (idx > len * 2)
        idx -= len;
    }
    cnt--;
    temp[idx] = 'A'; //왼쪽 가운데 오른쪽에 해당하는 문자를 다 바꿔줘야 한다.
    temp[idx - len] = 'A';
    temp[idx + len] = 'A';
  }
  return total;
}

int solution(string name)
{
  int answer = 0;
  answer += moveVertical(name);
  answer += moveHorizontal(name);
  return answer;
}