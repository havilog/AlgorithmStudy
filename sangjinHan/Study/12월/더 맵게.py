import heapq

def solution(scoville, K):
    answer = 0

    heapq.heapify(scoville)

    while True:
        one = heapq.heappop(scoville)
        two = heapq.heappop(scoville)
        mixed = one + (two * 2)
        answer += 1

        heapq.heappush(scoville,mixed)

        if scoville[0] >= K:
            break

        if len(scoville) < 2:
            return -1

    return answer
