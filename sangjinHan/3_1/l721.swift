var accounts = [["John", "johnsmith@mail.com", "john00@mail.com"], ["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"], ["Mary", "mary@mail.com"]]
var check: [Bool] = Array(repeating:true, count:accounts.count)
//1. append
//2. set
//var str = [[String]:Set<String>()]()
func accountsMerge(_ accounts: [[String]]) -> [[String]] {
    var answerStr = [[String]]()
	
    // answerStr.append(accounts[0])//["John", "johnsmith@mail.com", "john00@mail.com"]
    
	for i in 0..<accounts.count{
        for j in 0..<accounts[i].count{// ["John", "johnnybravo@mail.com"]
			if (accounts[i][0] == accounts[j][0]) && check[i]{
				answerStr.append(accounts[i])
				
				check[i]=false
			} 
			print(check)
		}
    }
	return answerStr
}
print(accountsMerge(accounts))