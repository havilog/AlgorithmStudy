#include<iostream>
#include<stack>
#include<string>
#include<map>
using namespace std;
class Solution {
public:
    string countOfAtoms(string formula) {
        if (formula.size() == 0) return "";
        
        stack<pair<string,int>> st;
        map<string, int> counter;
        string atomic;
        int b = 0, e = 1, count, multiply;
        while (b < formula.size()) {
            while (e < formula.size() && !((formula[e] >= 'A' && formula[e] <= 'Z') || formula[e] == '(' || formula[e] == ')')){             
                e++;
            }
            if (formula[b] >= 'A' && formula[b] <= 'Z') {
                getAtomicCount(formula.substr(b, e-b), atomic, count);
                st.push({atomic,count});
            } else if (formula[b] == '(') {
                st.push({"(",0});
            } else if (formula[b] == ')') {
                multiply = getCount(formula.substr(b+1, e-b+1));
                stack<pair<string,int>> temp;
                while (!st.empty() && st.top().first != "(") {
                    atomic = st.top().first; 
                    count = st.top().second;
                    st.pop();
                    count *= multiply;
                    temp.push({atomic, count});
                }
                st.pop(); // remove '('
                while (!temp.empty()) {
                    st.push(temp.top()); 
                    temp.pop();
                }
            }
            b = e;
            e = e+1;
        }
        while (!st.empty()) {
            atomic = st.top().first;
            count = st.top().second;
            st.pop();
            auto it = counter.find(atomic);
            if (it == counter.end()) counter.insert({atomic, count});
            else it->second += count;
        }
        
        string ans;
        for (auto it = counter.begin(); it != counter.end(); it++) {
            ans += it->first;
            if (it->second > 1)
                ans += to_string(it->second);
        }
        return ans;
    }
    
    void getAtomicCount(string f, string& atomic, int& count) {
        int m = 0;
        while (m < f.size() && !(f[m] >= '0' && f[m] <= '9')) {
            m++;
        }
        if (m == f.size()) {
            atomic = f;
            count = 1;
        } else {
            atomic = f.substr(0, m);
            count = atoi(f.substr(m, f.size()-m).c_str());
        }
    }
    
    int getCount(string f) {
        return atoi(f.c_str());
    }
};
int main(void){
    return 0;
}