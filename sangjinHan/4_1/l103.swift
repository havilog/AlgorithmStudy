//103. Binary Tree Zigzag Level Order Traversal
/*

    3
   / \
  9  20
    /  \
   15   7

[
  [3],
  [20,9],
  [15,7]
]
*/
// Definition for a binary tree node.
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    private enum Direction {
        case right
        case left
    }

    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]()
        guard let root = root else { return ans }
        var queue = [root]
        var direction = Direction.left
        while !queue.isEmpty {
            let count = queue.count
            var sub = [Int]()
            for i in 0..<count {
                let curr = queue.removeFirst()
                switch direction {
                case .right:
                    sub.append(curr.val)
                case .left:
                    sub.insert(curr.val, at: 0)
                }
                if let right = curr.right {
                    queue.append(right)
                }
                if let left = curr.left {
                    queue.append(left)
                }
            }
            ans.append(sub)
            direction = direction == .left ? .right : .left
        }
        return ans
    }
}