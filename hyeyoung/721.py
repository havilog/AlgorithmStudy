class Solution:
    def accountsMerge(self, accounts: List[List[str]]) -> List[List[str]]:

        email_lst = {}
        email_not_bind = {}
        name_lst = []

        answer = []

        for ac in accounts:
            # 이메일 주소록에 해당 사람의 이름이 없으면 추가한다
            if ac[0] not in email_lst.keys():
                email_lst[ac[0]] = [ac[1:]]
                email_not_bind[ac[0]] = ac[1:]
                name_lst.append(ac[0])

            else:
                email_lst[ac[0]].append(ac[1:])
                email_not_bind[ac[0]] = email_not_bind[ac[0]] + ac[1:]

        to_do_delet = []
        for name in name_lst:  # 각각의 사람들의 이메일에 대해
            for email in set(email_not_bind[name]):  # 이메일들의 리스트
                if email_not_bind[name].count(email) != 1:  # 중복되는 이메일이 있으면
                    to_do_delet.append((name, email))  # 삭제 예정에 집어넣고
        to_do_name = [x[0] for x in to_do_delet]
        result = []
        for td in to_do_delet:
            tmp_email = []
            for ee in email_lst[td[0]]:  # 해당하는 이름의 이메일 리스트를 확인해서
                if td[1] in ee:  # 지워야할 이메일이 있으면 잠시 임시변수에 담아두고
                    tmp_email = tmp_email + ee
                else:  # 없으면
                    tmp_result = [td[0]] + ee
                    result.append(tmp_result)
                    email_lst[td[0]] += tmp_result
            tmp_result = [td[0]]
            tmp_result += list(set(tmp_email))
            result.append(tmp_result)

            # print("tmp:", tmp_answer)
            # print("resutl", result)

        for name in name_lst:
            if name not in to_do_name:
                # print(name)
                rr = [account for account in accounts if name in account]
                result = result + rr
        result = [[res[0]] + sorted(res[1:]) for res in result]

        for i in result:
            if result.count(i) != 1:
                result.remove(i)

        return result