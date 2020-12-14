import heapq

def solution(people, limit):
    answer = 0
    heap = []

    people.sort(reverse = True)

    for person in people:
        remain = limit - person

        if heap:
            if remain >= heap[0]:
                heapq.heappop(heap)
                answer += 1
                continue

        heapq.heappush(heap,person)

    # print(heap)

    answer += len(heap)

    return answer
