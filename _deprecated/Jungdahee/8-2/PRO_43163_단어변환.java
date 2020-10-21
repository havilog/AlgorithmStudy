class Solution {

    public static int result;
    public static boolean selected[];
    
    public int solution(String begin, String target, String[] words) {
        result = Integer.MAX_VALUE;
        selected = new boolean[words.length];
        dfs(0, begin, target, words);

        if(result == Integer.MAX_VALUE) return 0;
        else return result;
    }
    
    public static void dfs(int cnt, String begin, String target, String words[]){
         if(begin.equals(target)){
             if(cnt < result) result = cnt;
             return;
         }

         for(int i = 0; i < words.length; i++){
             if(selected[i]) continue;

             int diff = 0;
             for(int j = 0; j < begin.length(); j++){
                 if(begin.charAt(j) != words[i].charAt(j)) diff++;
             }

             if(diff == 1) {
                 selected[i] = true;
                 dfs(cnt + 1, words[i], target, words);
                 selected[i] = false;
             }
         }
     }
}
