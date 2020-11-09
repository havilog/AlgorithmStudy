from itertools import combinations

def solution(numbers):
    answer = set()
    
    for a,b in combinations(numbers,2):
        answer.add(a+b)
        
    answer = sorted(list(answer))
    
    return answer