# def palindrome(string):
#     if len(string) <= 1:
#         return True
    
#     if string[0] == string[-1]:
#         return palindrome(string[1:-1])
#     else:
#         return False

# def solution(s):
#     for cut in range(len(s), 0, -1):
#         for start in range(0, len(s)):
#             cutStr = s[start:start+cut]
#             # 자른 string 전달
#             if palindrome(cutStr) == True:
#                 return len(cutStr)
            
#             if start+cut >= len(s):
#                 break

print(solution("abcdcba"))

def longest_palindrome(s):
    longest_palindrome = 0
    table = [[False for i in range(len(s))] for j in range(len(s))]

    for i in range(len(s)):
        for j in range(len(s)-i):
            if i < 2:
                if s[j] == s[i+j]:
                    table[j][i+j] = True
                    longest_palindrome = i+1
                else:
                    table[j][i+j] = False
            else:
                if s[j] == s[i+j] and table[j+1][i+j-1]:
                    table[j][i+j] = True
                    longest_palindrome = i+1                    
                else:
                    table[j][i+j] = False
    return longest_palindrome

def solution(s):
    return longest_palindrome(s)