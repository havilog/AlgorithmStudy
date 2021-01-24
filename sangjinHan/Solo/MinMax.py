def solution(s):
    answer = ''

    strArr = s.split(" ")
    intArr = list(map(int, strArr))

    answer += str(min(intArr)) + " " + str(max(intArr))

    return answer
