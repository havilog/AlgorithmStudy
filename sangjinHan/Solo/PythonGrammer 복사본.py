array = [i for i in range(20) if i % 2 == 1]
# [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]

array.append(1)
array.sort() # reverse = True
array.reverse()
array.insert(1, 123)
array.count(1)
array.remove(1)

print(array)
# [19, 123, 17, 15, 13, 11, 9, 7, 5, 3, 1]

dic = dict() # {}
dic[1] = 1
dic[2] = 2
dic[3] = 3

keyList = dic.keys()
valueList = dic.values()

if 1 in dic:
    print("yes")


data = {1, 1, 1, 2, 3, 3}
data2 = set([1, 1, 1, 2, 3, 3 , 4, 5])

print(data | data2) # 합집합 {1, 2, 3, 4, 5}
print(data & data2) # 교집합 {1, 2, 3}
print(data2 - data) # 차집합 {4, 5}

data.add(10)
data.update([11, 12])
data.remove(1)

a = sum(array)
b = min(array)
c = max(array)
d = eval("(3+5) * 7")
e = sorted([("a",1),("b",2),("c",3)],key = lambda x: x[1], reverse = True)

from itertools import permutations
result = list(permutations(array,2))
# abc acb bac ...

from itertools import combinations
comb = [1,2,3]
res = list(combinations(comb,2)) # 3개 중에 2개를 뽑는 모든 조합
# ab ac bc ...

from itertools import product
data = [1,2,3]
res = list(product(data,repeat = 2)) # 2개를 뽑는 모든 순열 구하기 (중복 허용)
# aa ab ac ba bb bc ...

from itertools import combinations_with_replacement
data = [1,2,3]
res = list(combinations_with_replacement(data, 2)) # 2개를 뽑는 모든 조합 구하기 (중복 허용)
# aa ab ac bb bc cc

import heapq

def heapsort(iterable):
    h = []
    result = []
    for val in iterable:
        heapq.heappush(h,val) # 반대면 -val

    for i in range(len(h)):
        result.append(heapq.heappop(h)) # -heapq

    return result

# O(logN)
from bisect import bisect_left, bisect_right
a = [1,2,4,4,8]
x = 4

print(bisect_left(a,x)) # 2
print(bisect_right(a,x)) # 4

def countByRange(a, leftVal, rightVal):
    rightIdx = bisect_right(a,rightVal)
    leftIdx = bisect_left(a,leftVal)
    return rightIdx - leftIdx

a = [1,2,3,3,3,3,4,4,8,9]

# 값이 4인 개수 출력
print(countByRange(a,4,4)) # 2

# [-1,3]사이 출력
print(countByRange(a,-1,3)) # 6

from collections import deque
data = deque([2,3,4])

data.appendleft(1)
data.append(5)
print(list(data)) # 1,2,3,4,5

from collections import Counter
counter = Counter([1,1,1,2,2,3,3,3,3])
print(dict(counter)) # 나온 횟수 변환

import math

math.factorial(3) # 6
math.gcd(21,14) # 최대공약수 = 7
math.sqrt(9) # 3
