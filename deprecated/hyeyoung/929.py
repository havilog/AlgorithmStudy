class Solution:
    def numUniqueEmails(self, emails: List[str]) -> int:
        answer_lst = []
        for email in emails:
            component = email.split('@')
            domain = component[1]
            local = component[0].split('+')[0]  # '+'뒤는 모두 무시되므로, 앞만 고려
            local = local.replace('.', '')
            answer_lst.append( local +"@"+ domain)
        # 중복되지 않은 이메일의 개수를 구한다
        answer  = len(set(answer_lst))
        return answer