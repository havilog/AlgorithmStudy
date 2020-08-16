class Solution:
    def accountsMerge(self, accounts: List[List[str]]) -> List[List[str]]:

        em_to_name = {}  # 나중에 이메일을 보고 해당되는 이름을 찾기위해 email:name
        mail_idx = collections.defaultdict(set)  # 딕셔너리를 초기화한다
        for account in accounts:
            name = account[0]
            for email in account[1:]:  # 이메일들을 하나씩 본다
                mail_idx[email].add(account[1])
                mail_idx[account[1]].add(email)
                em_to_name[email] = name

        # 자신의 무리를 찾아서 더이상 확인할 필요가 없는 메일들
        already_checked = set()
        answer = []
        for mail in mail_idx:
            if mail not in already_checked:
                already_checked.add(mail)
                stack = []
                stack.append(mail)
                sub_ans = []  # 중복되지 않은 메일들을 담을 공간
                while stack:
                    node = stack.pop()
                    sub_ans.append(node)
                    for cnt_mail in mail_idx[node]:
                        if cnt_mail not in already_checked:
                            stack.append(cnt_mail)
                            already_checked.add(cnt_mail)
                answer.append([em_to_name[mail]] + sorted(sub_ans))
        return answer
