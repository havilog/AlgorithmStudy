#include<iostream>
#include<vector>
#include<queue>
#include<string>
using namespace std;

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode() : val(0), left(nullptr), right(nullptr) {}
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
};
 
class Solution {
public:
    int maximum = 0;
    
    vector<pair<string, int>> bfs(TreeNode* root) {
        vector<pair<string, int>> vec;
        queue<pair<TreeNode*, int>> q;
        vec.push_back({to_string(root->val), 0});
        q.push({root, 0});

        while(!q.empty()) {
            TreeNode* front = q.front().first;
            int depth = q.front().second;
            if(maximum < depth) maximum = depth;
            q.pop();
            if(front->left == NULL) vec.push_back({"NULL", depth + 1});
            else {
                q.push({front->left, depth + 1});
                vec.push_back({to_string(front->left->val), depth + 1});
            }
            if(front->right == NULL) vec.push_back({"NULL", depth + 1});
            else {
                q.push({front->right, depth + 1});
                vec.push_back({to_string(front->right->val), depth + 1});
            }
        }
        return vec;
    }
    
    vector<vector<int>> zigzagLevelOrder(TreeNode* root) {
        if(root == NULL) {          
            vector<vector<int>> answer;
            return answer;
        }
        vector<pair<string, int>> vec = bfs(root);  //root를 bfs방식으로 탐색해서 반환
        vector<vector<int>> answer(maximum + 1);    //트리의 높이 만큼 벡터의 크기를 설정
        for(auto iter: vec) {           
            if(iter.first != "NULL") 
                answer[iter.second].push_back(stoi(iter.first));
        }

        for(int i = 0; i < answer.size(); i++)
            if(i % 2) reverse(answer[i].begin(), answer[i].end());
        return answer;
    }
};
int main(void){
  return 0;
}