class Solution:
    def addBinary(self, s: str, t: str) -> str:
        answer = ''
        temp = 0

        s = list(s)
        t = list(t)

        while s or t or temp :
            if s:
                temp += int(s.pop())
            if t:
                temp += int(t.pop())

            answer += str(temp % 2)
            temp //= 2

        return answer[::-1]
