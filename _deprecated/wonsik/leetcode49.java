import java.util.*;

public class leetcode49 {
    public List<List<String>> groupAnagrams(String[] strs) {
        HashMap<String, List<String>> map = new HashMap<>();

        for(int i=0; i<strs.length; i++){
            char[]charArray = strs[i].toCharArray();
            Arrays.sort(charArray);
            String sortedStr = String.valueOf(charArray);

            if(!map.containsKey(sortedStr)){
                map.put(sortedStr, new LinkedList<>());
            }
            map.get(sortedStr).add(strs[i]);
        }

        return new LinkedList<>(map.values());
    }
}
