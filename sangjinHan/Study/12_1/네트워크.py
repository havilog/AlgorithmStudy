def solution(n, computers):
    answer = 0
    visit = [0 for _ in range(n)]
    
    def dfs(start):
        st = [start]
        
        while st:
            com_num = st.pop()
            if visit[com_num] == 0:
                visit[com_num] = 1
            for i in range(len(computers[0])):
                if computers[com_num][i] == 1 and visit[i] == 0:
                    st.append(i)
                    
    i = 0
    while 0 in visit:
        if visit[i] == 0:
            dfs(i)
            answer += 1
        i += 1
    return answer
}