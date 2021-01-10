def solution(clothes):
    d = {}

    for cloth in clothes:
        if d.get(cloth[1]):
            d[cloth[1]] += 1
        else:
            d[cloth[1]] = 1

    sum = 1
    for value in d.values():
        sum *= value + 1

    return sum