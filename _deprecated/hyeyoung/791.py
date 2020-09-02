class Solution:
    def customSortString(self, S: str, T: str) -> str:

        # S에 있는 원소는 순서 그대로
        S = list(S)
        T = list(T)
        # S에서 T에 없는 문자들 제거하기
        out_lst = [s for s in S if s not in T]
        S = [s for s in S if s not in out_lst]

        # S에있는 문자중 T에있으면 지우기 작업
        for s in S:
            if s in T:
                T.remove(s)  # 한번만 지우기
        # t에서 남은 문자들 집어넣기
        for t in T:
            if t in S:
                idx = S.index(t)
                S.insert(idx, t)
            else:
                S.append(t)

        return "".join(S)