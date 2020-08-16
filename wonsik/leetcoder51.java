import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

public class leetcoder51 {
    public static void main(String []args) {
        solveNQueens(4);
    }

    public static List<List<String>> solveNQueens(int n) {
        res = new LinkedList<>();
        size = n;
        map = new int[size];
        placeQueen(0);

        return res;
    }

    static void placeQueen(int row){
        for(int i=0; i<size; i++) {
            map[row]=i;
            if(isValid(row)) {
                if(row==size-1){
                    List<String> list = new LinkedList<>();
                    HashMap<Integer, Integer> convert = new HashMap();

                    for(int j=0; j<size; j++){
                        convert.put(map[j], j);
                    }

                    for(int j=0; j<size; j++){
                        int isQ = convert.get(j);
                        String line ="";
                        for(int k=0; k<size; k++){
                            if(k==isQ) line = line + "Q";
                            else line = line + ".";
                        }
                        list.add(line);
                    }

                    res.add(list);

                }
                else {
                    placeQueen(row+1);
                }
            }
        }
    }

    static boolean isValid(int num){
        for(int i=0;i<num;i++) {
            if(map[num]==map[i]) {
                return false;
            }
            if (num-i==Math.abs(map[num]-map[i])){
                return false;
            }
        }
        return true;
    }

    static int []map;
    static int size;
    static List<List<String>> res;
}
