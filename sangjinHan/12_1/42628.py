#힙

import heapq

def solution(operations):
  h = []
  for i in operations:
    a,b = i.split(" ")
    if a == "I":
      heapq.heappush(h,int(b))
    else :
      if len(h) > 0 :
        if b == "1":
          h.pop(h.index(heapq.nlargest(1,h)[0]))
        else:
          heapq.heappop(h)
      else:
        pass

  if len(h) == 0 :
    return [0,0]
  else:
    return [heapq.nlargest(1,h)[0],heapq.nsmallest(1,h)[0]]


operations = ["I 7","I 5","I -5","D -1"]

print(solution(operations))


"""
import heapq

def solution(operations):
    heap = []

    for operation in operations:
        operator, operand = operation.split(' ')
        operand = int(operand)

        if operator == 'I':
            heapq.heappush(heap, operand)
        elif heap:
            if operand < 0:
                heapq.heappop(heap)
            else:
                heap.remove(max(heap))

    if not heap:
        return [0, 0]

    return [max(heap), heap[0]]
  """