#추석트래픽

t1 = [
'2016-09-15 20:59:57.421 0.351s',
"2016-09-15 20:59:58.233 1.181s",
"2016-09-15 20:59:58.299 0.8s",
"2016-09-15 20:59:58.688 1.041s",
"2016-09-15 20:59:59.591 1.412s",
"2016-09-15 21:00:00.464 1.466s",
"2016-09-15 21:00:00.741 1.581s",
"2016-09-15 21:00:00.748 2.31s",
"2016-09-15 21:00:00.966 0.381s",
"2016-09-15 21:00:02.066 2.62s"
]

t2 = ['2016-09-15 00:00:00.000 2.3s', '2016-09-15 23:59:59.999 0.1s']

t3 = ["2016-09-15 00:00:00.000 3s"]

t4 = ['2016-09-15 01:00:04.002 2.0s', '2016-09-15 01:00:07.000 2s', '2016-09-15 01:00:06.000 2s']

def solution(lines):
    nums = []
    for line in lines:
        newLine = line.replace("2016-09-15 ","").split(" ")
        t1 = newLine[0].split(":")
        t2 = int(t1[0])*3600 + int(t1[1])*60 + float(t1[2])
        t3 = int(t2*1000)

        duration = int(float(newLine[1].replace("s",""))*1000)

        nums.append([t3-duration+1,t3])
    
    # print(nums)

    answer = [1 for i in range(len(nums))]

    for (i,num) in enumerate(nums):
        for n in nums:
            if n == num:
                continue

            # print("n : ",n )
            if num[1] < n[1] and num[1]+1000 > n[0]:
                # print("yes")
                answer[i] += 1

    # print(answer)

    return max(answer)

print(solution(t1))