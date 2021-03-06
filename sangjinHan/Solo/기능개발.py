from collections import deque

def solution(progresses, speeds):
    answer = []

    while progresses:
        progresses = [x + speeds[i] for i, x in enumerate(progresses)]

        temp = 0
        while progresses:
            if progresses[0] >= 100:
                progresses.pop(0)
                speeds.pop(0)
                temp += 1
            else :
                break

        if temp:
            answer.append(temp)

    return answer


# print(solution([4,3,5,7,8,2,9]))
print(solution([93, 30, 55], [1,30,5]))
