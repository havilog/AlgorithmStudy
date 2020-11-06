class Solution {
    public String shiftingLetters(String S, int[] shifts) {
        char[] strArr = S.toCharArray(); 
        int len = S.length();
        int[] sum = new int[len];
        for(int i=0;i<len;i++){
            for(int j=i;j<len;j++){
                sum[i]+=shifts[j];
            }
            sum[i]%=26; //소문자 개수 26
            strArr[i] = (char) ((strArr[i] - 'a' + sum[i])%26 + 'a');//문자 계산 부분 미완료
        }
        return String.valueOf(strArr);
    }
}
//아직 완료 못함
/*
class Solution {
    public String shiftingLetters(String S, int[] shifts) {
        char[] ch = S.toCharArray();
        int cum_shift = 0;
        
		// loop over the characters reversed and keep track of the updated shift value
        for(int i = ch.length-1; i >= 0; i--){
            cum_shift += shifts[i];
            cum_shift %= 26;
			// 'a' is subtracted and added so that the ch[i] value does not go to uncertain values
            ch[i] = (char) ((ch[i] - 'a' + cum_shift)%26 + 'a');
        }
        
		// return the string value
        return String.valueOf(ch);
    }
}
*/