class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:

        word_criterion = []
        answer = {}

        for word in strs:
            sort_word = sorted(list(word))  # 단어의 철자를 오름차순으로 정렬한다
            if sort_word not in word_criterion:  # 고유의 단어순과 일치되는게 없으면 answer에 키값으로 등록하고 단어 표준 (word_criterion)에 등록
                word_criterion.append(sort_word)
                answer[tuple(sort_word)] = [word]
            else:
                answer[tuple(sort_word)] += [word]
        result = answer.values()
        return result