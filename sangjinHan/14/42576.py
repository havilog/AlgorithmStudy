from collections import defaultdict
def solution(participant, completion):
    answer = ''
    dict = {}
    dict = defaultdict(lambda:0, dict)
    
    for runner in participant:
        dict[runner] += 1
    
    for complit in completion:
        dict[complit] -= 1
    
    for key,value in dict.items():
        if value != 0:
            answer = key
    
    return answer


print(solution(["mislav", "stanko", "mislav", "ana"], ["stanko", "ana", "mislav"]))