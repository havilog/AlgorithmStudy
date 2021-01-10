//47. Permutations II

/*
Input: [1,1,2]
Output:
[
  [1,1,2],
  [1,2,1],
  [2,1,1]
]
*/

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else { return [] }
        
        let sorted = nums.sorted()
        var candidates = [Int]()
        var result = [[Int]]()
        var isVisited = Array(repeating: false, count: nums.count)
        
        backTracking(sorted, &candidates, &result, &isVisited)
        return result
    }
    
    // assume its like a tree
    func backTracking(_ nums: [Int], _ candidates: inout [Int], _ result: inout [[Int]], _ isVisited: inout [Bool]) {
        // when reach the leaves
        guard candidates.count < nums.count else {
            result.append(candidates)
            return 
        }
        
        for i in 0..<nums.count where !isVisited[i] {

            // filter out cases when a number has same value with its previous, and its previous is not used, we mark as "@" in below graph; like sibling same value cases
            if i > 0 && nums[i-1] == nums[i] && !isVisited[i-1] { continue }
            
            candidates.append(nums[i])
            isVisited[i] = true
            
            backTracking(nums, &candidates, &result, &isVisited)
            
            candidates.removeLast()
            isVisited[i] = false
        }
        
    }
}


// eg: [1, 1, 2]; assume it's like a tree; "*" means duplicated cases, "@" means who have same value of its previous' sibling
//                           [ ]
//              /             |                \
//            [1]            [@1]               [2]
//           /   \          /   \             /   \
//       [1,1]  [1,2]    *[1,1] *[1,2]      [2,1]  [2,@1]
//         /       \       /        \        /       \
//     [1,1,2]  [1,2,1] *[1,1,2]  *[1,2,1] [2,1,1]  *[2,1,1]

//    output: [[1,1,2],[1,2,1],[2,1,1]]