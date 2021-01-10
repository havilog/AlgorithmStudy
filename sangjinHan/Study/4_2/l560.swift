//560. Subarray Sum Equals K
/*
Input:nums = [1,1,1], k = 2
Output: 2
*/


class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var hashMap = [Int: Int]()
        hashMap[0] = 1
        var sum: Int = 0
        var count: Int = 0
        
        // O(n)
        for num in nums {
            sum += num
            if let diffCount = hashMap[sum - k] {
                count += diffCount
            }
            hashMap[sum] = (hashMap[sum] ?? 0) + 1
        }
        
        return count
    }
}