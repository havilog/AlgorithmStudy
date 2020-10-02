//파일명 정렬
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

struct File {
    string head, tail, num;
    int number, cnt;
};

string toUpper(string str) {
    string result = "";
    for(auto iter: str) result += toupper(iter);
    return result;
}

bool compare(File a, File b) {
    if(toUpper(a.head) < toUpper(b.head)) return true;
    else if(toUpper(a.head) == toUpper(b.head)) {
        if(a.number < b.number) return true;
        else if(a.number == b.number) return a.cnt < b.cnt;
        else return false;
    } else return false;
}

File splitFile(string files, int cnt) {
    File file;
    int idx = 0;
    string temp = "";
    for(idx = 0; idx < files.length(); idx++) {
        if(files[idx] < '0' || files[idx] > '9') temp += files[idx];
        else break;
    }
    file.head = temp;
    temp = "";
    
    for( ; idx < files.length(); idx++){
        if(files[idx] >= '0' && files[idx] <= '9') temp += files[idx];
        else break;
    }
    file.num = temp;
    file.number = stoi(temp);
    
    if(idx != files.length()) file.tail = files.substr(idx);
    file.cnt = cnt;
    return file;
}

vector<string> solution(vector<string> files) {
    vector<string> answer;
    vector<File> vec;
    for(int i = 0; i < files.size(); i++) vec.push_back(splitFile(files[i], i));
    sort(vec.begin(), vec.end(), compare);
    for(auto iter: vec) {
        string temp = "";
        temp += iter.head;
        temp += iter.num;
        temp += iter.tail;
        answer.push_back(temp);
    }
    return answer;
}