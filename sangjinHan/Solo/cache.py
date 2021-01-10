def solution(cacheSize, cities):
    if cacheSize == 0:
        return len(cities) * 5

    answer = 0
    cash = [""] * cacheSize

    for city in cities:
        city = city.lower()

        if city not in cash:
            answer += 5
            if len(cash) == cacheSize:
                cash.pop()
        else:
            answer += 1
            cash.pop(cash.index(city))

        cash.insert(0, city)

    return answer
