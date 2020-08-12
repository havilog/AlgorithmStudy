//test case
/*
test.email+alex@leetcode.com
test.e.mail+bob.cathy@leetcode.com
testemail+david@lee.tcode.com

["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
*/
let inputSize = 3
var answer = 0
var emails = [String]()

func initTestCase() -> [String]{
	var inputStr = [String]()
	
	for _ in 0..<inputSize{	
		let input : String = readLine()!
		inputStr.append(input)
	}
	
	return inputStr
}


func numUniqueEmails(_ emails:[String]) -> Int{	
	var answerStr = Set<String>()
	
	for i in 0..<emails.count{
		let emailStr = emails[i].split(separator:"@")//[test.email+alex,leetcode.com]
		let trimmedStr = emailStr[0].split(separator:"+")//["test.email", "alex"]
		let removedStr = trimmedStr[0].split(separator:".").joined()////testemail
		
		answerStr.insert("\(removedStr)@\(emailStr[1])")
	}
	return answerStr.count
}

emails = initTestCase()
answer = numUniqueEmails(emails)

print(answer)




/*leetcode short
    func numUniqueEmails(_ emails: [String]) -> Int {
        var emailSet:Set<String> = []
        for s in emails{
            let address = s.components(separatedBy: "@")
            let name = address[0].components(separatedBy: "+").first?.filter({$0 != "."})
            emailSet.insert(name!+address.last!)
        }
        return emailSet.count
    }
*/


/* Beats 100%
class Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        guard emails.count > 0 else { return 0 }
        var resultSet = Set<String>()
        
        for email in emails {
            let seperated = email.split(separator: "@")
            let local = seperated[0], validDomain = seperated[1]
            var validLocal = String()
            
            for char in local where char != "." {
                guard char != "+" else { break }
                validLocal.append(char)
            }
            
            let validFormat = validLocal + "@" + validDomain
            resultSet.insert(String(validFormat))
        }
        return resultSet.count
    }
}
*/