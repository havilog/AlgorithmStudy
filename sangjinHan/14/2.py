def solution(s):
    zero = 0
    count = 0
    answer = []
    
    while True:
        if s == "1":
            break
        
        temp = ""
        binary = ""
        
        # 0 제거
        for i in s:
            if i == "0":
                zero += 1
            else:
                temp += "1"
        
        # 제거 후 길이
        length = len(temp)
        
        # 이진 변환 결과
        while True:
            if length == 0 :
                break
            binary += str(length%2)
            length = length//2
        
        binary = int(binary[::-1])
        
        s = str(binary)
        count += 1
    
    answer.append(count)
    answer.append(zero)
    
    return answer
