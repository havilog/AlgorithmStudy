def solution(citations):
    citations.sort()
    l = len(citations)
    for i in range(l):
        if citations[i] >= l-i:
            return l-i
    return 0

print(solution([1,1,1,1,2,3,4,4,4,5,6,7,7,8,8]))
