//721. Accounts Merge
/* Union Find solution
class Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        
        // Initialize parent dictionary.
        var parent: [Int: Int] = [:]
        for i in 0..<accounts.count {
            parent[i] = i
        }
        
        // find function for union find.
        func find(_ i: Int) -> Int {
            var i = i
            while i != parent[i] {
                i = parent[i]!
            }
            return i
        }
        
        var emailToIndex: [String: Int] = [:]
        for (i, account) in accounts.enumerated() {
            let name = account[0]
            for j in 1..<account.count {
                let email = account[j]
                if let idx = emailToIndex[email] {
                    // Union.
                    parent[find(i)] = find(idx)
                } else {
                    emailToIndex[email] = i
                }
            }
        }
        
        var merged: [Int: [String]] = [:]
        for email in emailToIndex.keys {
            // Find the root index for that group.
            let rootIndex = find(emailToIndex[email]!)
            if merged[rootIndex] == nil {
                merged[rootIndex] = []
            }
            merged[rootIndex]!.append(email)
        }
        
        var res: [[String]] = []
        for (i, emails) in merged {
            var emails = emails
            emails.sort()
            res.append([accounts[i][0]] + emails)
        }
        
        return res
    }
}
*/

/* DFS solution
class Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var emailToName: [String: String] = [:]
        var graph: [String: Set<String>] = [:]
        
        //Pre-init my graph: Technically there are ways to skip this with default values. Just wanted to make my code readable. 
        accounts.forEach { account in
            account.forEach { email in
                graph[email] = Set<String>()                         
            }
        }
        
        //Build Graph 
        //Loop through emails and populate graph
        for emails in accounts {
            emailToName[emails[1]] = emails[0]
            for i in 2..<emails.count {
                graph[emails[i]]!.insert(emails[i - 1])
                graph[emails[i - 1]]!.insert(emails[i]) 
                emailToName[emails[i]] = emails[0]
            } 
        }
        
        //Depth First Search 
        var seen: Set<String> = [] 
        var answer: [[String]] = []
        
        //Loop through graph and start dfs process
        for (key, value) in graph {
            let email = key
            if !seen.contains(email) {
                var stack: [String] = [] 
                var component: [String] = [] 
                
                seen.insert(email)
                stack.append(email)
                
                while !stack.isEmpty {
                    let poppedEmail = stack.removeLast() 
                    component.append(poppedEmail)
                    if let neighbors = graph[poppedEmail] {
                        for neighbor in neighbors {
                            if !seen.contains(neighbor) { 
                                seen.insert(neighbor)
                                stack.append(neighbor)
                            }
                        } 
                    } 
                }
                
                //Build answer
                if let name = emailToName[email] {
                    component.sort() 
                    component.insert(name, at: 0)
                    answer.append(component)   
                }
            } 
        }  
        return answer 
    }
}
*/