class Solution:
    def letterCombinations(self, digits: str) -> List[str]:

        numToWord = {'2': ['a', 'b', 'c'],
                     '3': ['d', 'e', 'f'],
                     '4': ['g', 'h', 'i'],
                     '5': ['j', 'k', 'l'],
                     '6': ['m', 'n', 'o'],
                     '7': ['p', 'q', 'r', 's'],
                     '8': ['t', 'u', 'v'],
                     '9': ['w', 'x', 'y', 'z']}

        def backTracking(word, digit):
            if len(digit) == 0:
                answer.append(word)
            else:
                for alpa in numToWord[digit[0]]:
                    backTracking(word + alpa, digit[1:])  # 앞글자를 땐 나머지도 반복연산한다

        answer = []
        if digits:
            backTracking("", digits)
        return answer