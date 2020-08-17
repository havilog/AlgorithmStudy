#include<iostream>
#include<string>
#include<vector>
using namespace std;


class Solution {
public:
    vector<vector<string>> answer;
    bool canVisit(vector<string> &vec, int y, int x, int &N) {      //놓을 수 있는 위치인지 확인한다.
        int tmpY = y, tmpX = x;
        for(int i = 0; i < y; i++)  //위쪽 방향을 확인
            if(vec[i][x] == 'Q') return false;

        while(1) {      //왼쪽 위 대각선을 확인
            if(tmpY < 0 || tmpX < 0) break;
            if(vec[tmpY--][tmpX--] == 'Q') return false;
        }

        while(1) {      //오른쪽 위 대각선을 확인
            if(x >= N || y < 0) break;
            if(vec[y--][x++] == 'Q') return false;
        }
        return true;
    }

    void backtracking(int N, vector<string> vec, int depth) {
        if(depth == N) {    //깊이를 N까지 다 놓았다면 answer에 push해주고 return
            answer.push_back(vec);
            return;
        }

        for(int i = 0; i < N; i++) {
            if(canVisit(vec, depth, i, N)) {   //vec[depth][i]좌표에 놓을 수 있다면
                vec[depth][i] = 'Q';
                backtracking(N, vec, depth + 1);
                vec[depth][i] = '.';
            }
        }
    }

    vector<string> reset(int N){        
        //배열의 값을 .으로 초기화
        vector<string> vec;
        string str = "";
        for(int i = 0; i < N; i++) str += '.';
        for(int i = 0; i < N; i++) vec.push_back(str);
                return vec;        
    }

    vector<vector<string>> solveNQueens(int n) {
        vector<string> vec = reset(n);
        backtracking(n, vec, 0);
        return answer;
    }
};

int main(void){
    return 0;
}