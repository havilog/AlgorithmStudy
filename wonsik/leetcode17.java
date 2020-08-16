import java.util.LinkedList;
import java.util.List;

class leetcode17 {
    public List<String> letterCombinations(String digits) {
        res = new LinkedList<>();
        digitss = digits;
        makeCombinations( "", 0);
        return res;
    }

    static void makeCombinations(String curString, int curIndex){
        if(curIndex == digitss.length()){
            if(!curString.equals("")) res.add(curString);
        }
        else{
            String posSuffix = list[(digitss.charAt(curIndex)-'0')-2];
            for(int i=0; i<posSuffix.length(); i++) {
                makeCombinations(curString + posSuffix.charAt(i), curIndex+1);
            }
        }
    }

    static String digitss;
    static List<String> res;
    static String[] list = new String[]{"abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"};
}