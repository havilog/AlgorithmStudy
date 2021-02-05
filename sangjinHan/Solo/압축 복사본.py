def solution(msg):
    answer = []
    alpha = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    dict = {}
    start, end = 0, 0
    temp = msg[start]

    for al in alpha:
        dict[al] = alpha.index(al) + 1

    while True:
        if end == len(msg) - 1:
            break

        if temp in alpha:
            end += 1
            temp += msg[end]
        else:
            answer.append(dict[temp[:-1]])
            alpha.append(temp)
            dict[temp] = alpha.index(temp) + 1
            start = end
            temp = msg[start]

    if temp in alpha:
        answer.append(dict[temp])
    else:
        answer.append(dict[temp[:-1]])
        start = end
        answer.append(dict[msg[start]])

    return answer


print(solution("TOBEORNOTTOBEORTOBEORNOT"))
