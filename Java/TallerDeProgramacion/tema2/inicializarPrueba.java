package tema2;

public class inicializarPrueba {
    
    public static void main(String[] args) {
    
    int [][] m = new int [8][4];
    
    int i, j;
    for (i = 0; i < 8; i++)
        for (j = 0; j < 4 ; j++)
            m[i][j] = 0; 
    
    //int i, j;
    for (i = 0; i < 8; i++) {
        System.out.println("");
        for (j = 0; j < 4; j++)
            System.out.print(" | "+ m[i][j]);
    }
   }
}