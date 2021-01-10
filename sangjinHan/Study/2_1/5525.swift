import Foundation

let N = Int(readLine()!)!
let len = Int(readLine()!)!
let arr = Array(readLine()!)
var Ans = 0
var i = 0
while i < len {
    if i < len-2 && arr[i+1] == "O" && arr[i+2] == "I" {
        var oCnt = 0
        while i < len-2 && arr[i] == "I" && arr[i+1] == "O" && arr[i+2] == "I" {
            oCnt += 1
            i += 2
            if oCnt == N {
                oCnt -= 1
                Ans += 1
            }
        }
    }
    i += 1
}

print(Ans)