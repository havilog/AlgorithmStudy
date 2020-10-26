# def solution(n):
#     dp = [0 for i in range(n)]

#     dp[0] = 1
#     dp[1] = 2

#     for i in range(2,n):
#         dp[i] = dp[i-1] + dp[i-2]

#     return dp[n-1] % 1000000007

def solution(n):
    a,b = 1,1

    for i in range(n):
        a,b = b,a+b
    
    return a%1000000007

print(solution(5))